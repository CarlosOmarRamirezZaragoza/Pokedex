/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for saving or removing a Pokemon from local storage. */

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@lazySingleton
class ToggleSavePokemonUseCase {
  final PokemonRepository _repository;

  const ToggleSavePokemonUseCase(this._repository);

  Future<ResultWrapper<void>> execute(Pokemon pokemon) {
    return _repository.toggleSavePokemon(pokemon);
  }
}
