/** 
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: High-performance Data Source using Isolates for JSON parsing. */

import 'dart:async';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/data/models/pokemon_dto.dart';
import 'package:pokemon/src/data/models/pokemon_list_response.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonDto>> getPokemonList({required int limit, required int offset});
  Future<PokemonDto> getPokemonDetail(String idOrName);
  Future<PokemonSlimDto> getPokemonSlimDetail(String idOrName);
}

@LazySingleton(as: PokemonRemoteDataSource)
class PokemonRemoteDataSourceImpl with ApiHelper implements PokemonRemoteDataSource {
  final Dio _dio;
  final Map<String, Future<PokemonSlimDto>> _slimCache = {};

  PokemonRemoteDataSourceImpl(this._dio);

  @override
  Future<List<PokemonDto>> getPokemonList({required int limit, required int offset}) async {
    final result = await safeApiCall(
      operation: () => _dio.get<Map<String, dynamic>>(
        ApiConstants.pokemonList,
        queryParameters: {'limit': limit, 'offset': offset},
      ),
    );

    return result.when(
      success: (data) => PokemonListResponse.fromJson(data).results.map((r) {
        final id = int.parse(r.url.split('/').reversed.elementAt(1));
        return PokemonDto(
          id: id,
          name: r.name,
          sprites: SpritesDto(frontDefault: '${ApiConstants.pokemonArtworkBaseUrl}$id.png'),
        );
      }).toList(),
      failure: (e) => throw e,
    );
  }

  @override
  Future<PokemonDto> getPokemonDetail(String idOrName) async {
    final result = await safeApiCall(
      operation: () => _dio.get<Map<String, dynamic>>('${ApiConstants.pokemonDetail}$idOrName'),
    );
    return result.when(success: (data) => PokemonDto.fromJson(data), failure: (e) => throw e);
  }

  @override
  Future<PokemonSlimDto> getPokemonSlimDetail(String idOrName) {
    return _slimCache.putIfAbsent(idOrName, () => _executeSlimRequest(idOrName));
  }

  Future<PokemonSlimDto> _executeSlimRequest(String idOrName) async {
    try {
      final response = await _dio.get<String>(
        '${ApiConstants.pokemonDetail}$idOrName',
        options: Options(responseType: ResponseType.plain),
      );
      
      // Senior: Execute heavy JSON parsing in a separate Isolate to keep UI 60FPS
      return await compute(_parsePokemonSlim, response.data!);
    } catch (e) {
      _slimCache.remove(idOrName);
      throw UnknownError(e.toString());
    }
  }
}

// Global function for Isolate compute
PokemonSlimDto _parsePokemonSlim(String rawJson) {
  final Map<String, dynamic> fullMap = jsonDecode(rawJson) as Map<String, dynamic>;
  return PokemonSlimDto(
    id: fullMap['id'] as int,
    name: fullMap['name'] as String,
    types: (fullMap['types'] as List).map((t) {
      final typeInfo = (t as Map<String, dynamic>)['type'] as Map<String, dynamic>;
      return TypeEntryDto(type: TypeDto(name: typeInfo['name'] as String));
    }).toList(),
  );
}
