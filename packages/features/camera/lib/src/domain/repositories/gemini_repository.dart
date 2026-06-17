/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Interface for AI-based Pokemon identification. */

import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';

abstract class GeminiRepository {
  Future<ResultWrapper<Pokemon>> identifyPokemon(Uint8List imageBytes);
}
