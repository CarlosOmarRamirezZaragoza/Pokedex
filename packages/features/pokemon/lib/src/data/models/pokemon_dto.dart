/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Data Transfer Object for a Pokemon with null safety defaults. */

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';

part 'pokemon_dto.freezed.dart';
part 'pokemon_dto.g.dart';

@freezed
class PokemonDto with _$PokemonDto {
  const factory PokemonDto({
    @Default(0) int id,
    @Default('') String name,
    @Default(SpritesDto()) SpritesDto sprites,
    @Default([]) List<TypeEntryDto> types,
    @Default([]) List<AbilityEntryDto> abilities,
  }) = _PokemonDto;

  factory PokemonDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDtoFromJson(json);

  const PokemonDto._();

  Pokemon toDomain() {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: sprites.frontDefault ?? '',
      types: types.map((e) => e.type.name).toList(),
      abilities: abilities.map((e) => e.ability.name).toList(),
    );
  }
}

@freezed
class PokemonSlimDto with _$PokemonSlimDto {
  const factory PokemonSlimDto({
    @Default(0) int id,
    @Default('') String name,
    @Default([]) List<TypeEntryDto> types,
  }) = _PokemonSlimDto;

  factory PokemonSlimDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSlimDtoFromJson(json);

  const PokemonSlimDto._();

  Pokemon toDomain() {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      types: types.map((e) => e.type.name).toList(),
      abilities: [],
    );
  }
}

@freezed
class AbilityEntryDto with _$AbilityEntryDto {
  const factory AbilityEntryDto({
    @Default(AbilityDto()) AbilityDto ability,
  }) = _AbilityEntryDto;

  factory AbilityEntryDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityEntryDtoFromJson(json);
}

@freezed
class AbilityDto with _$AbilityDto {
  const factory AbilityDto({
    @Default('') String name,
  }) = _AbilityDto;

  factory AbilityDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityDtoFromJson(json);
}

@freezed
class SpritesDto with _$SpritesDto {
  const factory SpritesDto({
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _SpritesDto;

  factory SpritesDto.fromJson(Map<String, dynamic> json) =>
      _$SpritesDtoFromJson(json);
}

@freezed
class TypeEntryDto with _$TypeEntryDto {
  const factory TypeEntryDto({
    @Default(TypeDto()) TypeDto type,
  }) = _TypeEntryDto;

  factory TypeEntryDto.fromJson(Map<String, dynamic> json) =>
      _$TypeEntryDtoFromJson(json);
}

@freezed
class TypeDto with _$TypeDto {
  const factory TypeDto({
    @Default('') String name,
  }) = _TypeDto;

  factory TypeDto.fromJson(Map<String, dynamic> json) =>
      _$TypeDtoFromJson(json);
}
