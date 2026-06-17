/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Pure business model for a Pokemon.
 * Relevant Info: Uses Freezed for immutability. */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
    required List<String> types,
    required List<String> abilities,
    @Default(false) bool isSaved,
  }) = _Pokemon;
}
