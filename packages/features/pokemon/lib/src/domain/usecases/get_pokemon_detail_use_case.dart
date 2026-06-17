/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for fetching specific Pokemon details.
 * Relevant Info: Injectable business logic. */

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@lazySingleton
class GetPokemonDetailUseCase {
  final PokemonRepository _repository;

  const GetPokemonDetailUseCase(this._repository);

  Future<ResultWrapper<Pokemon>> execute(String idOrName) {
    return _repository.getPokemonDetail(idOrName);
  }
}
