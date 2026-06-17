/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for fetching the list of saved Pokemon. */

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@lazySingleton
class GetSavedPokemonsUseCase {
  final PokemonRepository _repository;

  const GetSavedPokemonsUseCase(this._repository);

  Future<ResultWrapper<List<Pokemon>>> execute() {
    return _repository.getSavedPokemons();
  }
}
