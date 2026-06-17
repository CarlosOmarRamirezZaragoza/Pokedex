/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Optimized Pokemon screen with TabBar. */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/presentation/notifiers/pokemon_notifier.dart';
import 'package:pokemon/src/presentation/notifiers/saved_pokemon_notifier.dart';

class PokemonScreen extends ConsumerStatefulWidget {
  const PokemonScreen({super.key});

  @override
  ConsumerState<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends ConsumerState<PokemonScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {}

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonNotifierProvider);
    final savedState = ref.watch(savedPokemonNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          context.push('/camera');
        },
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or ID',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(pokemonNotifierProvider.notifier)
                              .searchPokemon('');
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onSubmitted: (value) {
                ref.read(pokemonNotifierProvider.notifier).searchPokemon(value);
                if (_tabController.index != 0) {
                  _tabController.animateTo(0);
                }
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Pokemons'),
              Tab(text: 'Saved'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: List and Search
                Builder(builder: (context) {
                  if (pokemonState.hasValue) {
                    final pokemonList = pokemonState.value!;
                    if (pokemonList.isEmpty && !pokemonState.isLoading) {
                      return const Center(child: Text('No Pokemon found'));
                    }
                    final isSearching = _searchController.text.isNotEmpty;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isSearching)
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Text(
                              'Results',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: pokemonList.length,
                            itemBuilder: (context, index) {
                              final pokemon = pokemonList[index];

                              // Trigger next page when 5 elements from bottom
                              if (!isSearching && 
                                  !pokemonState.isLoading && 
                                  index >= pokemonList.length - 5) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  ref.read(pokemonNotifierProvider.notifier).fetchNextPage();
                                });
                              }

                              return _PokemonCard(pokemon: pokemon);
                            },
                          ),
                        ),
                        if (!isSearching && pokemonState.isLoading)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            color: Colors.grey[50],
                            child: const Center(
                              child: Text(
                                'Loading more Pokemons...',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }

                  if (pokemonState.hasError) {
                    return Center(child: Text('Error: ${pokemonState.error}'));
                  }

                  return const Center(
                      child: CircularProgressIndicator(color: Colors.red));
                }),
                // Tab 2: Saved
                savedState.when(
                  data: (savedList) {
                    if (savedList.isEmpty) {
                      return const Center(child: Text('No saved Pokemon'));
                    }
                    return ListView.builder(
                      itemCount: savedList.length,
                      itemBuilder: (context, index) {
                        return _PokemonCard(pokemon: savedList[index]);
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator(color: Colors.red)),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Hero(
            tag: 'pokemon_${pokemon.id}',
            child: Image.network(
              pokemon.imageUrl,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
            ),
          ),
        ),
        title: Text(
          pokemon.name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          '#${pokemon.id.toString().padLeft(3, '0')}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () => context.go('/detail/${pokemon.id}'),
      ),
    );
  }
}
