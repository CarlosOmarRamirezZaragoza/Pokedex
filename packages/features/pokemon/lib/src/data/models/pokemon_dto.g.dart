// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDtoImpl _$$PokemonDtoImplFromJson(Map<String, dynamic> json) =>
    _$PokemonDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      sprites: json['sprites'] == null
          ? const SpritesDto()
          : SpritesDto.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TypeEntryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((e) => AbilityEntryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PokemonDtoImplToJson(_$PokemonDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'types': instance.types,
      'abilities': instance.abilities,
    };

_$PokemonSlimDtoImpl _$$PokemonSlimDtoImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSlimDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TypeEntryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PokemonSlimDtoImplToJson(
        _$PokemonSlimDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
    };

_$AbilityEntryDtoImpl _$$AbilityEntryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AbilityEntryDtoImpl(
      ability: json['ability'] == null
          ? const AbilityDto()
          : AbilityDto.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AbilityEntryDtoImplToJson(
        _$AbilityEntryDtoImpl instance) =>
    <String, dynamic>{
      'ability': instance.ability,
    };

_$AbilityDtoImpl _$$AbilityDtoImplFromJson(Map<String, dynamic> json) =>
    _$AbilityDtoImpl(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$AbilityDtoImplToJson(_$AbilityDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$SpritesDtoImpl _$$SpritesDtoImplFromJson(Map<String, dynamic> json) =>
    _$SpritesDtoImpl(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$$SpritesDtoImplToJson(_$SpritesDtoImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

_$TypeEntryDtoImpl _$$TypeEntryDtoImplFromJson(Map<String, dynamic> json) =>
    _$TypeEntryDtoImpl(
      type: json['type'] == null
          ? const TypeDto()
          : TypeDto.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TypeEntryDtoImplToJson(_$TypeEntryDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_$TypeDtoImpl _$$TypeDtoImplFromJson(Map<String, dynamic> json) =>
    _$TypeDtoImpl(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$TypeDtoImplToJson(_$TypeDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
