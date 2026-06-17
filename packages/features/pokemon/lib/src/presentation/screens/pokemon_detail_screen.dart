/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Screen to show pokemon details with wireframe design. */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/presentation/notifiers/pokemon_detail_notifier.dart';
import 'package:pokemon/src/presentation/notifiers/saved_pokemon_notifier.dart';
import 'package:pokemon/src/presentation/notifiers/pokemon_notifier.dart';

class PokemonDetailScreen extends ConsumerWidget {
  final String idOrName;
  final Pokemon? pokemon;
  const PokemonDetailScreen({super.key, required this.idOrName, this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(pokemonDetailNotifierProvider(idOrName, initialPokemon: pokemon));
    final pokemonName = detailState.valueOrNull?.name ?? idOrName;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'POKEMON',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        actions: [
          detailState.when(
            data: (pokemon) {
              final savedList = ref.watch(savedPokemonNotifierProvider).valueOrNull ?? [];
              final isSaved = savedList.any((p) => p.id == pokemon.id);

              return IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: isSaved ? Colors.red : Colors.black,
                ),
                onPressed: () async {
                  await ref.read(savedPokemonNotifierProvider.notifier).toggleSave(pokemon);
                  // Refresh the detail to update the internal isSaved flag if needed
                  ref.invalidate(pokemonDetailNotifierProvider(idOrName, initialPokemon: pokemon));
                },
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: detailState.maybeWhen(
        data: (pokemon) => _buildDetail(pokemon),
        orElse: () {
          if (detailState.hasValue) {
            return _buildDetail(detailState.value!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDetail(Pokemon pokemon) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: 'pokemon_${pokemon.id}',
                child: Image.network(
                  pokemon.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '#${pokemon.id.toString().padLeft(3, '0')}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            pokemon.name.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(height: 48),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Types',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                if (pokemon.types.isEmpty)
                  const Text('Loading types...', style: TextStyle(color: Colors.grey))
                else
                  Row(
                    children: pokemon.types
                        .map((type) => Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Text(
                                type.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                const SizedBox(height: 32),
                const Text(
                  'Abilities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                if (pokemon.abilities.isEmpty)
                  const Text('Loading abilities...', style: TextStyle(color: Colors.grey))
                else
                  ...pokemon.abilities.map((ability) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            const Text('•', style: TextStyle(fontSize: 24, color: Colors.black)),
                            const SizedBox(width: 12),
                            Text(
                              ability.toUpperCase(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
