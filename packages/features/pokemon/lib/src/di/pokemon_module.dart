/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: DI Module for Pokemon specific dependencies. */

import 'package:injectable/injectable.dart';
import 'package:pokemon/src/data/local/pokemon_database.dart';

@module
abstract class PokemonModule {
  @lazySingleton
  PokemonDatabase get database => PokemonDatabase();
}
