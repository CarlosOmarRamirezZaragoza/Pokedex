/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Data Transfer Object for the Pokemon list response.
 * Relevant Info: Used for pagination. */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_response.freezed.dart';
part 'pokemon_list_response.g.dart';

@freezed
class PokemonListResponse with _$PokemonListResponse {
  const factory PokemonListResponse({
    @Default(0) int count,
    @Default([]) List<PokemonNamedResourceDto> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}

@freezed
class PokemonNamedResourceDto with _$PokemonNamedResourceDto {
  const factory PokemonNamedResourceDto({
    @Default('') String name,
    @Default('') String url,
  }) = _PokemonNamedResourceDto;

  factory PokemonNamedResourceDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonNamedResourceDtoFromJson(json);
}
