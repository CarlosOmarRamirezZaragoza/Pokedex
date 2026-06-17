/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Riverpod Notifier for managing saved Pokemon. */

import 'package:get_it/get_it.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/domain/usecases/get_saved_pokemons_use_case.dart';
import 'package:pokemon/src/domain/usecases/toggle_save_pokemon_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_pokemon_notifier.g.dart';

@riverpod
class SavedPokemonNotifier extends _$SavedPokemonNotifier {
  @override
  FutureOr<List<Pokemon>> build() {
    return _fetchSavedList();
  }

  Future<List<Pokemon>> _fetchSavedList() async {
    final useCase = GetIt.I<GetSavedPokemonsUseCase>();
    final result = await useCase.execute();
    return result.when(
      success: (data) => data,
      failure: (error) => [],
    );
  }

  Future<void> toggleSave(Pokemon pokemon) async {
    final useCase = GetIt.I<ToggleSavePokemonUseCase>();
    await useCase.execute(pokemon);
    ref.invalidateSelf();
  }
}
