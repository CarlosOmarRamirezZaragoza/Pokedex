/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Optimized PokemonRepository with instant local lookup. */

import 'package:core/core.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/data/local/pokemon_database.dart';
import 'package:pokemon/src/data/local/pokemon_local_data_source.dart';
import 'package:pokemon/src/data/models/pokemon_dto.dart';
import 'package:pokemon/src/data/models/pokemon_list_response.dart';
import 'package:pokemon/src/data/remote/pokemon_remote_data_source.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart' as dom;
import 'package:pokemon/src/domain/repositories/pokemon_repository.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _remoteDataSource;
  final PokemonLocalDataSource _localDataSource;

  const PokemonRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<ResultWrapper<dom.Pokemon>> getPokemonDetail(String idOrName) async {
    try {
      // 1. Instant local lookup
      final local = await _localDataSource.getPokemonByIdOrName(idOrName);
      
      // If we have it and it's SAVED, return immediately
      if (local != null && local.isSaved && local.types.isNotEmpty) {
        return Success(_mapLocalToDomain(local));
      }

      // 2. Fetch remote
      final dto = await _remoteDataSource.getPokemonDetail(idOrName);
      final domain = dto.toDomain();

      // IMPORTANT: Do NOT save to DB here to avoid excessive cache.
      // Only merge current saved status from DB.
      return Success(domain.copyWith(isSaved: local?.isSaved ?? false));
    } catch (e) {
      final local = await _localDataSource.getPokemonByIdOrName(idOrName);
      if (local != null) return Success(_mapLocalToDomain(local));
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<ResultWrapper<dom.Pokemon>> getPokemonSlimDetail(String idOrName) async {
    try {
      final local = await _localDataSource.getPokemonByIdOrName(idOrName);
      if (local != null && local.types.isNotEmpty) {
        return Success(_mapLocalToDomain(local));
      }

      final dto = await _remoteDataSource.getPokemonSlimDetail(idOrName);
      return Success(dto.toDomain());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<ResultWrapper<List<dom.Pokemon>>> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    try {
      final dtos = await _remoteDataSource.getPokemonList(limit: limit, offset: offset);
      final domains = dtos.map((e) => e.toDomain()).toList();

      // Senior: NO save to DB here. Only memory. 
      // Check saved status from DB for UI.
      final savedList = await _localDataSource.getSavedPokemons();
      final savedIds = savedList.map((p) => p.id).toSet();

      final listWithStatus = domains.map((p) => p.copyWith(
        isSaved: savedIds.contains(p.id),
      )).toList();

      return Success(listWithStatus);
    } catch (e) {
      final locals = await _localDataSource.getPokemons(limit: limit, offset: offset);
      if (locals.isNotEmpty) return Success(locals.map(_mapLocalToDomain).toList());
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<ResultWrapper<void>> toggleSavePokemon(dom.Pokemon pokemon) async {
    try {
      final local = await _localDataSource.getPokemonByIdOrName(pokemon.id.toString());
      final isSaved = !(local?.isSaved ?? false);
      
      final localEntity = _mapDomainToLocal(pokemon).copyWith(
        isSaved: Value(isSaved),
      );

      await _localDataSource.upsertPokemon(localEntity);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<ResultWrapper<List<dom.Pokemon>>> getSavedPokemons() async {
    try {
      final locals = await _localDataSource.getSavedPokemons();
      return Success(locals.map(_mapLocalToDomain).toList());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  dom.Pokemon _mapLocalToDomain(PokemonEntity data) {
    return dom.Pokemon(
      id: data.id,
      name: data.name,
      imageUrl: data.imageUrl,
      types: data.types.isEmpty ? [] : data.types.split(','),
      abilities: data.abilities.isEmpty ? [] : data.abilities.split(','),
      isSaved: data.isSaved,
    );
  }

  PokemonsCompanion _mapDomainToLocal(dom.Pokemon domain) {
    return PokemonsCompanion.insert(
      id: Value(domain.id),
      name: domain.name,
      imageUrl: domain.imageUrl,
      types: domain.types.join(','),
      abilities: domain.abilities.join(','),
      isSaved: Value(domain.isSaved),
    );
  }
}
