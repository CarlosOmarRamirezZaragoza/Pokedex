/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Contract for Pokemon data operations.
 * Relevant Info: Follows Dependency Inversion. */

import 'package:core/core.dart'; // I will need to export core src in a main file
import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<ResultWrapper<List<Pokemon>>> getPokemonList({
    required int limit,
    required int offset,
  });
  Future<ResultWrapper<Pokemon>> getPokemonDetail(String idOrName);
  Future<ResultWrapper<Pokemon>> getPokemonSlimDetail(String idOrName);
  Future<ResultWrapper<void>> toggleSavePokemon(Pokemon pokemon);
  Future<ResultWrapper<List<Pokemon>>> getSavedPokemons();
}
