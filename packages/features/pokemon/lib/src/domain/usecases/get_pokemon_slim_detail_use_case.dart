/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for fetching minimal Pokemon details (ID, Name, Types). */

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@lazySingleton
class GetPokemonSlimDetailUseCase {
  final PokemonRepository _repository;

  const GetPokemonSlimDetailUseCase(this._repository);

  Future<ResultWrapper<Pokemon>> execute(String idOrName) {
    return _repository.getPokemonSlimDetail(idOrName);
  }
}
