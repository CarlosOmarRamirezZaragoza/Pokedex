// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonDto _$PokemonDtoFromJson(Map<String, dynamic> json) {
  return _PokemonDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SpritesDto get sprites => throw _privateConstructorUsedError;
  List<TypeEntryDto> get types => throw _privateConstructorUsedError;
  List<AbilityEntryDto> get abilities => throw _privateConstructorUsedError;

  /// Serializes this PokemonDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDtoCopyWith<PokemonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDtoCopyWith<$Res> {
  factory $PokemonDtoCopyWith(
          PokemonDto value, $Res Function(PokemonDto) then) =
      _$PokemonDtoCopyWithImpl<$Res, PokemonDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      SpritesDto sprites,
      List<TypeEntryDto> types,
      List<AbilityEntryDto> abilities});

  $SpritesDtoCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonDtoCopyWithImpl<$Res, $Val extends PokemonDto>
    implements $PokemonDtoCopyWith<$Res> {
  _$PokemonDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sprites = null,
    Object? types = null,
    Object? abilities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as SpritesDto,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntryDto>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<AbilityEntryDto>,
    ) as $Val);
  }

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpritesDtoCopyWith<$Res> get sprites {
    return $SpritesDtoCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDtoImplCopyWith<$Res>
    implements $PokemonDtoCopyWith<$Res> {
  factory _$$PokemonDtoImplCopyWith(
          _$PokemonDtoImpl value, $Res Function(_$PokemonDtoImpl) then) =
      __$$PokemonDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      SpritesDto sprites,
      List<TypeEntryDto> types,
      List<AbilityEntryDto> abilities});

  @override
  $SpritesDtoCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonDtoImplCopyWithImpl<$Res>
    extends _$PokemonDtoCopyWithImpl<$Res, _$PokemonDtoImpl>
    implements _$$PokemonDtoImplCopyWith<$Res> {
  __$$PokemonDtoImplCopyWithImpl(
      _$PokemonDtoImpl _value, $Res Function(_$PokemonDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sprites = null,
    Object? types = null,
    Object? abilities = null,
  }) {
    return _then(_$PokemonDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as SpritesDto,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntryDto>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<AbilityEntryDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDtoImpl extends _PokemonDto {
  const _$PokemonDtoImpl(
      {this.id = 0,
      this.name = '',
      this.sprites = const SpritesDto(),
      final List<TypeEntryDto> types = const [],
      final List<AbilityEntryDto> abilities = const []})
      : _types = types,
        _abilities = abilities,
        super._();

  factory _$PokemonDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDtoImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final SpritesDto sprites;
  final List<TypeEntryDto> _types;
  @override
  @JsonKey()
  List<TypeEntryDto> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<AbilityEntryDto> _abilities;
  @override
  @JsonKey()
  List<AbilityEntryDto> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  String toString() {
    return 'PokemonDto(id: $id, name: $name, sprites: $sprites, types: $types, abilities: $abilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sprites, sprites) || other.sprites == sprites) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      sprites,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_abilities));

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDtoImplCopyWith<_$PokemonDtoImpl> get copyWith =>
      __$$PokemonDtoImplCopyWithImpl<_$PokemonDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonDto extends PokemonDto {
  const factory _PokemonDto(
      {final int id,
      final String name,
      final SpritesDto sprites,
      final List<TypeEntryDto> types,
      final List<AbilityEntryDto> abilities}) = _$PokemonDtoImpl;
  const _PokemonDto._() : super._();

  factory _PokemonDto.fromJson(Map<String, dynamic> json) =
      _$PokemonDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  SpritesDto get sprites;
  @override
  List<TypeEntryDto> get types;
  @override
  List<AbilityEntryDto> get abilities;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDtoImplCopyWith<_$PokemonDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonSlimDto _$PokemonSlimDtoFromJson(Map<String, dynamic> json) {
  return _PokemonSlimDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonSlimDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TypeEntryDto> get types => throw _privateConstructorUsedError;

  /// Serializes this PokemonSlimDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSlimDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSlimDtoCopyWith<PokemonSlimDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSlimDtoCopyWith<$Res> {
  factory $PokemonSlimDtoCopyWith(
          PokemonSlimDto value, $Res Function(PokemonSlimDto) then) =
      _$PokemonSlimDtoCopyWithImpl<$Res, PokemonSlimDto>;
  @useResult
  $Res call({int id, String name, List<TypeEntryDto> types});
}

/// @nodoc
class _$PokemonSlimDtoCopyWithImpl<$Res, $Val extends PokemonSlimDto>
    implements $PokemonSlimDtoCopyWith<$Res> {
  _$PokemonSlimDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSlimDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntryDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSlimDtoImplCopyWith<$Res>
    implements $PokemonSlimDtoCopyWith<$Res> {
  factory _$$PokemonSlimDtoImplCopyWith(_$PokemonSlimDtoImpl value,
          $Res Function(_$PokemonSlimDtoImpl) then) =
      __$$PokemonSlimDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<TypeEntryDto> types});
}

/// @nodoc
class __$$PokemonSlimDtoImplCopyWithImpl<$Res>
    extends _$PokemonSlimDtoCopyWithImpl<$Res, _$PokemonSlimDtoImpl>
    implements _$$PokemonSlimDtoImplCopyWith<$Res> {
  __$$PokemonSlimDtoImplCopyWithImpl(
      _$PokemonSlimDtoImpl _value, $Res Function(_$PokemonSlimDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSlimDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? types = null,
  }) {
    return _then(_$PokemonSlimDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntryDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSlimDtoImpl extends _PokemonSlimDto {
  const _$PokemonSlimDtoImpl(
      {this.id = 0, this.name = '', final List<TypeEntryDto> types = const []})
      : _types = types,
        super._();

  factory _$PokemonSlimDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSlimDtoImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  final List<TypeEntryDto> _types;
  @override
  @JsonKey()
  List<TypeEntryDto> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'PokemonSlimDto(id: $id, name: $name, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSlimDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_types));

  /// Create a copy of PokemonSlimDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSlimDtoImplCopyWith<_$PokemonSlimDtoImpl> get copyWith =>
      __$$PokemonSlimDtoImplCopyWithImpl<_$PokemonSlimDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSlimDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonSlimDto extends PokemonSlimDto {
  const factory _PokemonSlimDto(
      {final int id,
      final String name,
      final List<TypeEntryDto> types}) = _$PokemonSlimDtoImpl;
  const _PokemonSlimDto._() : super._();

  factory _PokemonSlimDto.fromJson(Map<String, dynamic> json) =
      _$PokemonSlimDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<TypeEntryDto> get types;

  /// Create a copy of PokemonSlimDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSlimDtoImplCopyWith<_$PokemonSlimDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AbilityEntryDto _$AbilityEntryDtoFromJson(Map<String, dynamic> json) {
  return _AbilityEntryDto.fromJson(json);
}

/// @nodoc
mixin _$AbilityEntryDto {
  AbilityDto get ability => throw _privateConstructorUsedError;

  /// Serializes this AbilityEntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbilityEntryDtoCopyWith<AbilityEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityEntryDtoCopyWith<$Res> {
  factory $AbilityEntryDtoCopyWith(
          AbilityEntryDto value, $Res Function(AbilityEntryDto) then) =
      _$AbilityEntryDtoCopyWithImpl<$Res, AbilityEntryDto>;
  @useResult
  $Res call({AbilityDto ability});

  $AbilityDtoCopyWith<$Res> get ability;
}

/// @nodoc
class _$AbilityEntryDtoCopyWithImpl<$Res, $Val extends AbilityEntryDto>
    implements $AbilityEntryDtoCopyWith<$Res> {
  _$AbilityEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
  }) {
    return _then(_value.copyWith(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as AbilityDto,
    ) as $Val);
  }

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AbilityDtoCopyWith<$Res> get ability {
    return $AbilityDtoCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbilityEntryDtoImplCopyWith<$Res>
    implements $AbilityEntryDtoCopyWith<$Res> {
  factory _$$AbilityEntryDtoImplCopyWith(_$AbilityEntryDtoImpl value,
          $Res Function(_$AbilityEntryDtoImpl) then) =
      __$$AbilityEntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AbilityDto ability});

  @override
  $AbilityDtoCopyWith<$Res> get ability;
}

/// @nodoc
class __$$AbilityEntryDtoImplCopyWithImpl<$Res>
    extends _$AbilityEntryDtoCopyWithImpl<$Res, _$AbilityEntryDtoImpl>
    implements _$$AbilityEntryDtoImplCopyWith<$Res> {
  __$$AbilityEntryDtoImplCopyWithImpl(
      _$AbilityEntryDtoImpl _value, $Res Function(_$AbilityEntryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
  }) {
    return _then(_$AbilityEntryDtoImpl(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as AbilityDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbilityEntryDtoImpl implements _AbilityEntryDto {
  const _$AbilityEntryDtoImpl({this.ability = const AbilityDto()});

  factory _$AbilityEntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbilityEntryDtoImplFromJson(json);

  @override
  @JsonKey()
  final AbilityDto ability;

  @override
  String toString() {
    return 'AbilityEntryDto(ability: $ability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbilityEntryDtoImpl &&
            (identical(other.ability, ability) || other.ability == ability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ability);

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbilityEntryDtoImplCopyWith<_$AbilityEntryDtoImpl> get copyWith =>
      __$$AbilityEntryDtoImplCopyWithImpl<_$AbilityEntryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbilityEntryDtoImplToJson(
      this,
    );
  }
}

abstract class _AbilityEntryDto implements AbilityEntryDto {
  const factory _AbilityEntryDto({final AbilityDto ability}) =
      _$AbilityEntryDtoImpl;

  factory _AbilityEntryDto.fromJson(Map<String, dynamic> json) =
      _$AbilityEntryDtoImpl.fromJson;

  @override
  AbilityDto get ability;

  /// Create a copy of AbilityEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbilityEntryDtoImplCopyWith<_$AbilityEntryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AbilityDto _$AbilityDtoFromJson(Map<String, dynamic> json) {
  return _AbilityDto.fromJson(json);
}

/// @nodoc
mixin _$AbilityDto {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AbilityDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbilityDtoCopyWith<AbilityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityDtoCopyWith<$Res> {
  factory $AbilityDtoCopyWith(
          AbilityDto value, $Res Function(AbilityDto) then) =
      _$AbilityDtoCopyWithImpl<$Res, AbilityDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$AbilityDtoCopyWithImpl<$Res, $Val extends AbilityDto>
    implements $AbilityDtoCopyWith<$Res> {
  _$AbilityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbilityDtoImplCopyWith<$Res>
    implements $AbilityDtoCopyWith<$Res> {
  factory _$$AbilityDtoImplCopyWith(
          _$AbilityDtoImpl value, $Res Function(_$AbilityDtoImpl) then) =
      __$$AbilityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$AbilityDtoImplCopyWithImpl<$Res>
    extends _$AbilityDtoCopyWithImpl<$Res, _$AbilityDtoImpl>
    implements _$$AbilityDtoImplCopyWith<$Res> {
  __$$AbilityDtoImplCopyWithImpl(
      _$AbilityDtoImpl _value, $Res Function(_$AbilityDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$AbilityDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbilityDtoImpl implements _AbilityDto {
  const _$AbilityDtoImpl({this.name = ''});

  factory _$AbilityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbilityDtoImplFromJson(json);

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'AbilityDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbilityDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of AbilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbilityDtoImplCopyWith<_$AbilityDtoImpl> get copyWith =>
      __$$AbilityDtoImplCopyWithImpl<_$AbilityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbilityDtoImplToJson(
      this,
    );
  }
}

abstract class _AbilityDto implements AbilityDto {
  const factory _AbilityDto({final String name}) = _$AbilityDtoImpl;

  factory _AbilityDto.fromJson(Map<String, dynamic> json) =
      _$AbilityDtoImpl.fromJson;

  @override
  String get name;

  /// Create a copy of AbilityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbilityDtoImplCopyWith<_$AbilityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpritesDto _$SpritesDtoFromJson(Map<String, dynamic> json) {
  return _SpritesDto.fromJson(json);
}

/// @nodoc
mixin _$SpritesDto {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;

  /// Serializes this SpritesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpritesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpritesDtoCopyWith<SpritesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpritesDtoCopyWith<$Res> {
  factory $SpritesDtoCopyWith(
          SpritesDto value, $Res Function(SpritesDto) then) =
      _$SpritesDtoCopyWithImpl<$Res, SpritesDto>;
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class _$SpritesDtoCopyWithImpl<$Res, $Val extends SpritesDto>
    implements $SpritesDtoCopyWith<$Res> {
  _$SpritesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpritesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpritesDtoImplCopyWith<$Res>
    implements $SpritesDtoCopyWith<$Res> {
  factory _$$SpritesDtoImplCopyWith(
          _$SpritesDtoImpl value, $Res Function(_$SpritesDtoImpl) then) =
      __$$SpritesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class __$$SpritesDtoImplCopyWithImpl<$Res>
    extends _$SpritesDtoCopyWithImpl<$Res, _$SpritesDtoImpl>
    implements _$$SpritesDtoImplCopyWith<$Res> {
  __$$SpritesDtoImplCopyWithImpl(
      _$SpritesDtoImpl _value, $Res Function(_$SpritesDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpritesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_$SpritesDtoImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpritesDtoImpl implements _SpritesDto {
  const _$SpritesDtoImpl({@JsonKey(name: 'front_default') this.frontDefault});

  factory _$SpritesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpritesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @override
  String toString() {
    return 'SpritesDto(frontDefault: $frontDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpritesDtoImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault);

  /// Create a copy of SpritesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpritesDtoImplCopyWith<_$SpritesDtoImpl> get copyWith =>
      __$$SpritesDtoImplCopyWithImpl<_$SpritesDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpritesDtoImplToJson(
      this,
    );
  }
}

abstract class _SpritesDto implements SpritesDto {
  const factory _SpritesDto(
          {@JsonKey(name: 'front_default') final String? frontDefault}) =
      _$SpritesDtoImpl;

  factory _SpritesDto.fromJson(Map<String, dynamic> json) =
      _$SpritesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;

  /// Create a copy of SpritesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpritesDtoImplCopyWith<_$SpritesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeEntryDto _$TypeEntryDtoFromJson(Map<String, dynamic> json) {
  return _TypeEntryDto.fromJson(json);
}

/// @nodoc
mixin _$TypeEntryDto {
  TypeDto get type => throw _privateConstructorUsedError;

  /// Serializes this TypeEntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeEntryDtoCopyWith<TypeEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeEntryDtoCopyWith<$Res> {
  factory $TypeEntryDtoCopyWith(
          TypeEntryDto value, $Res Function(TypeEntryDto) then) =
      _$TypeEntryDtoCopyWithImpl<$Res, TypeEntryDto>;
  @useResult
  $Res call({TypeDto type});

  $TypeDtoCopyWith<$Res> get type;
}

/// @nodoc
class _$TypeEntryDtoCopyWithImpl<$Res, $Val extends TypeEntryDto>
    implements $TypeEntryDtoCopyWith<$Res> {
  _$TypeEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeDto,
    ) as $Val);
  }

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeDtoCopyWith<$Res> get type {
    return $TypeDtoCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TypeEntryDtoImplCopyWith<$Res>
    implements $TypeEntryDtoCopyWith<$Res> {
  factory _$$TypeEntryDtoImplCopyWith(
          _$TypeEntryDtoImpl value, $Res Function(_$TypeEntryDtoImpl) then) =
      __$$TypeEntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TypeDto type});

  @override
  $TypeDtoCopyWith<$Res> get type;
}

/// @nodoc
class __$$TypeEntryDtoImplCopyWithImpl<$Res>
    extends _$TypeEntryDtoCopyWithImpl<$Res, _$TypeEntryDtoImpl>
    implements _$$TypeEntryDtoImplCopyWith<$Res> {
  __$$TypeEntryDtoImplCopyWithImpl(
      _$TypeEntryDtoImpl _value, $Res Function(_$TypeEntryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$TypeEntryDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeEntryDtoImpl implements _TypeEntryDto {
  const _$TypeEntryDtoImpl({this.type = const TypeDto()});

  factory _$TypeEntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeEntryDtoImplFromJson(json);

  @override
  @JsonKey()
  final TypeDto type;

  @override
  String toString() {
    return 'TypeEntryDto(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeEntryDtoImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeEntryDtoImplCopyWith<_$TypeEntryDtoImpl> get copyWith =>
      __$$TypeEntryDtoImplCopyWithImpl<_$TypeEntryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeEntryDtoImplToJson(
      this,
    );
  }
}

abstract class _TypeEntryDto implements TypeEntryDto {
  const factory _TypeEntryDto({final TypeDto type}) = _$TypeEntryDtoImpl;

  factory _TypeEntryDto.fromJson(Map<String, dynamic> json) =
      _$TypeEntryDtoImpl.fromJson;

  @override
  TypeDto get type;

  /// Create a copy of TypeEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeEntryDtoImplCopyWith<_$TypeEntryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeDto _$TypeDtoFromJson(Map<String, dynamic> json) {
  return _TypeDto.fromJson(json);
}

/// @nodoc
mixin _$TypeDto {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TypeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeDtoCopyWith<TypeDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeDtoCopyWith<$Res> {
  factory $TypeDtoCopyWith(TypeDto value, $Res Function(TypeDto) then) =
      _$TypeDtoCopyWithImpl<$Res, TypeDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TypeDtoCopyWithImpl<$Res, $Val extends TypeDto>
    implements $TypeDtoCopyWith<$Res> {
  _$TypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeDtoImplCopyWith<$Res> implements $TypeDtoCopyWith<$Res> {
  factory _$$TypeDtoImplCopyWith(
          _$TypeDtoImpl value, $Res Function(_$TypeDtoImpl) then) =
      __$$TypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$TypeDtoImplCopyWithImpl<$Res>
    extends _$TypeDtoCopyWithImpl<$Res, _$TypeDtoImpl>
    implements _$$TypeDtoImplCopyWith<$Res> {
  __$$TypeDtoImplCopyWithImpl(
      _$TypeDtoImpl _value, $Res Function(_$TypeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$TypeDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeDtoImpl implements _TypeDto {
  const _$TypeDtoImpl({this.name = ''});

  factory _$TypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeDtoImplFromJson(json);

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'TypeDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of TypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeDtoImplCopyWith<_$TypeDtoImpl> get copyWith =>
      __$$TypeDtoImplCopyWithImpl<_$TypeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeDtoImplToJson(
      this,
    );
  }
}

abstract class _TypeDto implements TypeDto {
  const factory _TypeDto({final String name}) = _$TypeDtoImpl;

  factory _TypeDto.fromJson(Map<String, dynamic> json) = _$TypeDtoImpl.fromJson;

  @override
  String get name;

  /// Create a copy of TypeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeDtoImplCopyWith<_$TypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
