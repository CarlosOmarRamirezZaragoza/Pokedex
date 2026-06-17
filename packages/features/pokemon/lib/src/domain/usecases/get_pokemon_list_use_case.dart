/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for fetching a paginated list of Pokemon.
 * Relevant Info: Injectable business logic. */

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@lazySingleton
class GetPokemonListUseCase {
  final PokemonRepository _repository;

  const GetPokemonListUseCase(this._repository);

  Future<ResultWrapper<List<Pokemon>>> execute({
    required int limit,
    required int offset,
  }) {
    return _repository.getPokemonList(limit: limit, offset: offset);
  }
}
