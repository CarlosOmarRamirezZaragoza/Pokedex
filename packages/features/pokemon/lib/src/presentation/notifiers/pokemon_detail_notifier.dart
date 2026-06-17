/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Notifier for Pokemon detail. */

import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokemon/src/presentation/notifiers/pokemon_notifier.dart';

part 'pokemon_detail_notifier.g.dart';

@riverpod
class PokemonDetailNotifier extends _$PokemonDetailNotifier {
  @override
  FutureOr<Pokemon> build(String idOrName, {Pokemon? initialPokemon}) async {
    // If we have initial data (from list), show it first
    if (initialPokemon != null && state is! AsyncData) {
      _fetchFullDetail(idOrName);
      return initialPokemon;
    }

    return _fetchFullDetail(idOrName);
  }

  Future<Pokemon> _fetchFullDetail(String idOrName) async {
    final useCase = ref.read(getPokemonDetailUseCaseFactoryProvider);
    final result = await useCase.execute(idOrName);

    return result.when(
      success: (data) {
        state = AsyncData(data);
        return data;
      },
      failure: (error) => throw error,
    );
  }
}
