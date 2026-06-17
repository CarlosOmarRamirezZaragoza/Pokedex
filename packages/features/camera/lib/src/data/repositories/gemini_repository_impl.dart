/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Implementation of GeminiRepository. */

import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import '../datasources/gemini_remote_data_source.dart';
import '../../domain/repositories/gemini_repository.dart';

@LazySingleton(as: GeminiRepository)
class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiRemoteDataSource _remoteDataSource;

  const GeminiRepositoryImpl(this._remoteDataSource);

  @override
  Future<ResultWrapper<Pokemon>> identifyPokemon(Uint8List imageBytes) async {
    try {
      final dto = await _remoteDataSource.identifyPokemon(imageBytes);
      return Success(dto.toDomain());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
