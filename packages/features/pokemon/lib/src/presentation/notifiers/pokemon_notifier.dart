/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: High-performance Notifier with Instant Search logic. */

import 'package:get_it/get_it.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_detail_use_case.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_list_use_case.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_slim_detail_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_notifier.g.dart';

@riverpod
GetPokemonListUseCase getPokemonListUseCaseFactory(GetPokemonListUseCaseFactoryRef ref) =>
    GetIt.I<GetPokemonListUseCase>();

@riverpod
GetPokemonDetailUseCase getPokemonDetailUseCaseFactory(GetPokemonDetailUseCaseFactoryRef ref) =>
    GetIt.I<GetPokemonDetailUseCase>();

@riverpod
GetPokemonSlimDetailUseCase getPokemonSlimDetailUseCaseFactory(GetPokemonSlimDetailUseCaseFactoryRef ref) =>
    GetIt.I<GetPokemonSlimDetailUseCase>();

@riverpod
class PokemonNotifier extends _$PokemonNotifier {
  bool _isFetching = false;

  @override
  FutureOr<List<Pokemon>> build() {
    return _fetchInitialList();
  }

  Future<List<Pokemon>> _fetchInitialList() async {
    final useCase = ref.read(getPokemonListUseCaseFactoryProvider);
    final result = await useCase.execute(limit: 10, offset: 0);
    return result.when(success: (data) => data, failure: (e) => throw e);
  }

  Future<void> fetchNextPage() async {
    if (_isFetching || state.isLoading) return;
    _isFetching = true;

    final previousState = state.valueOrNull ?? [];
    state = const AsyncLoading<List<Pokemon>>().copyWithPrevious(state);

    final useCase = ref.read(getPokemonListUseCaseFactoryProvider);
    final result = await useCase.execute(limit: 10, offset: previousState.length);

    result.when(
      success: (data) {
        state = AsyncData([...previousState, ...data]);
        _isFetching = false;
      },
      failure: (e) {
        state = AsyncValue.error(e, StackTrace.current);
        _isFetching = false;
      },
    );
  }

  Future<void> searchPokemon(String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) {
      state = await AsyncValue.guard(() => _fetchInitialList());
      return;
    }

    // 1. Instant Memory Search
    final current = state.valueOrNull ?? [];
    final inMemory = current.where((p) => p.name.contains(q) || p.id.toString() == q).toList();
    if (inMemory.isNotEmpty) {
      state = AsyncData(inMemory);
      return;
    }

    // 2. Remote Slim Search (Optimized)
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final slimUseCase = ref.read(getPokemonSlimDetailUseCaseFactoryProvider);
      final result = await slimUseCase.execute(q);
      return result.when(success: (p) => [p], failure: (_) => []);
    });
  }
}
