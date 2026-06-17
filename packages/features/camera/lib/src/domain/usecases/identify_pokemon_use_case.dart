/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Use case for identifying a Pokemon from an image. */

import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import '../repositories/gemini_repository.dart';

@lazySingleton
class IdentifyPokemonUseCase {
  final GeminiRepository _repository;

  const IdentifyPokemonUseCase(this._repository);

  Future<ResultWrapper<Pokemon>> execute(Uint8List imageBytes) {
    return _repository.identifyPokemon(imageBytes);
  }
}
