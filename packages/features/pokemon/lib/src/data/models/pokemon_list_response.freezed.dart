// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) {
  return _PokemonListResponse.fromJson(json);
}

/// @nodoc
mixin _$PokemonListResponse {
  int get count => throw _privateConstructorUsedError;
  List<PokemonNamedResourceDto> get results =>
      throw _privateConstructorUsedError;

  /// Serializes this PokemonListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListResponseCopyWith<PokemonListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListResponseCopyWith<$Res> {
  factory $PokemonListResponseCopyWith(
          PokemonListResponse value, $Res Function(PokemonListResponse) then) =
      _$PokemonListResponseCopyWithImpl<$Res, PokemonListResponse>;
  @useResult
  $Res call({int count, List<PokemonNamedResourceDto> results});
}

/// @nodoc
class _$PokemonListResponseCopyWithImpl<$Res, $Val extends PokemonListResponse>
    implements $PokemonListResponseCopyWith<$Res> {
  _$PokemonListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonNamedResourceDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListResponseImplCopyWith<$Res>
    implements $PokemonListResponseCopyWith<$Res> {
  factory _$$PokemonListResponseImplCopyWith(_$PokemonListResponseImpl value,
          $Res Function(_$PokemonListResponseImpl) then) =
      __$$PokemonListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<PokemonNamedResourceDto> results});
}

/// @nodoc
class __$$PokemonListResponseImplCopyWithImpl<$Res>
    extends _$PokemonListResponseCopyWithImpl<$Res, _$PokemonListResponseImpl>
    implements _$$PokemonListResponseImplCopyWith<$Res> {
  __$$PokemonListResponseImplCopyWithImpl(_$PokemonListResponseImpl _value,
      $Res Function(_$PokemonListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? results = null,
  }) {
    return _then(_$PokemonListResponseImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonNamedResourceDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListResponseImpl implements _PokemonListResponse {
  const _$PokemonListResponseImpl(
      {this.count = 0, final List<PokemonNamedResourceDto> results = const []})
      : _results = results;

  factory _$PokemonListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  final List<PokemonNamedResourceDto> _results;
  @override
  @JsonKey()
  List<PokemonNamedResourceDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_results));

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListResponseImplCopyWith<_$PokemonListResponseImpl> get copyWith =>
      __$$PokemonListResponseImplCopyWithImpl<_$PokemonListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListResponseImplToJson(
      this,
    );
  }
}

abstract class _PokemonListResponse implements PokemonListResponse {
  const factory _PokemonListResponse(
      {final int count,
      final List<PokemonNamedResourceDto> results}) = _$PokemonListResponseImpl;

  factory _PokemonListResponse.fromJson(Map<String, dynamic> json) =
      _$PokemonListResponseImpl.fromJson;

  @override
  int get count;
  @override
  List<PokemonNamedResourceDto> get results;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListResponseImplCopyWith<_$PokemonListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonNamedResourceDto _$PokemonNamedResourceDtoFromJson(
    Map<String, dynamic> json) {
  return _PokemonNamedResourceDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonNamedResourceDto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonNamedResourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonNamedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonNamedResourceDtoCopyWith<PokemonNamedResourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonNamedResourceDtoCopyWith<$Res> {
  factory $PokemonNamedResourceDtoCopyWith(PokemonNamedResourceDto value,
          $Res Function(PokemonNamedResourceDto) then) =
      _$PokemonNamedResourceDtoCopyWithImpl<$Res, PokemonNamedResourceDto>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonNamedResourceDtoCopyWithImpl<$Res,
        $Val extends PokemonNamedResourceDto>
    implements $PokemonNamedResourceDtoCopyWith<$Res> {
  _$PokemonNamedResourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonNamedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonNamedResourceDtoImplCopyWith<$Res>
    implements $PokemonNamedResourceDtoCopyWith<$Res> {
  factory _$$PokemonNamedResourceDtoImplCopyWith(
          _$PokemonNamedResourceDtoImpl value,
          $Res Function(_$PokemonNamedResourceDtoImpl) then) =
      __$$PokemonNamedResourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonNamedResourceDtoImplCopyWithImpl<$Res>
    extends _$PokemonNamedResourceDtoCopyWithImpl<$Res,
        _$PokemonNamedResourceDtoImpl>
    implements _$$PokemonNamedResourceDtoImplCopyWith<$Res> {
  __$$PokemonNamedResourceDtoImplCopyWithImpl(
      _$PokemonNamedResourceDtoImpl _value,
      $Res Function(_$PokemonNamedResourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonNamedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonNamedResourceDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonNamedResourceDtoImpl implements _PokemonNamedResourceDto {
  const _$PokemonNamedResourceDtoImpl({this.name = '', this.url = ''});

  factory _$PokemonNamedResourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonNamedResourceDtoImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'PokemonNamedResourceDto(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonNamedResourceDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonNamedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonNamedResourceDtoImplCopyWith<_$PokemonNamedResourceDtoImpl>
      get copyWith => __$$PokemonNamedResourceDtoImplCopyWithImpl<
          _$PokemonNamedResourceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonNamedResourceDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonNamedResourceDto implements PokemonNamedResourceDto {
  const factory _PokemonNamedResourceDto(
      {final String name, final String url}) = _$PokemonNamedResourceDtoImpl;

  factory _PokemonNamedResourceDto.fromJson(Map<String, dynamic> json) =
      _$PokemonNamedResourceDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonNamedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonNamedResourceDtoImplCopyWith<_$PokemonNamedResourceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
