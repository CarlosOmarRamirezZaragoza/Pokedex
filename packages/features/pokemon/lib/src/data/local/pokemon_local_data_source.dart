/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Data source for local Pokemon persistence. */

import 'package:drift/drift.dart' as d;
import 'package:injectable/injectable.dart';
import 'pokemon_database.dart';

abstract class PokemonLocalDataSource {
  Future<void> savePokemons(List<PokemonsCompanion> pokemons);
  Future<void> upsertPokemon(PokemonsCompanion pokemon);
  Future<List<PokemonEntity>> getPokemons({
    required int limit,
    required int offset,
  });
  Future<PokemonEntity?> getPokemonByIdOrName(String idOrName);
  Future<List<PokemonEntity>> searchPokemons(String query);
  Future<void> toggleSavePokemon(int id, bool isSaved);
  Future<List<PokemonEntity>> getSavedPokemons();
}

@LazySingleton(as: PokemonLocalDataSource)
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonDatabase _db;

  PokemonLocalDataSourceImpl(this._db);

  @override
  Future<void> savePokemons(List<PokemonsCompanion> pokemons) async {
    await _db.batch((batch) {
      batch.insertAll(
        _db.pokemons,
        pokemons,
        mode: d.InsertMode.insertOrIgnore,
      );
    });
  }

  @override
  Future<void> upsertPokemon(PokemonsCompanion pokemon) async {
    await _db.into(_db.pokemons).insertOnConflictUpdate(pokemon);
  }

  @override
  Future<List<PokemonEntity>> getPokemons({
    required int limit,
    required int offset,
  }) {
    return (_db.select(_db.pokemons)..limit(limit, offset: offset)).get();
  }

  @override
  Future<PokemonEntity?> getPokemonByIdOrName(String idOrName) async {
    final id = int.tryParse(idOrName);
    if (id != null) {
      return (_db.select(_db.pokemons)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
    }
    return (_db.select(_db.pokemons)
          ..where((t) => t.name.equals(idOrName.toLowerCase())))
        .getSingleOrNull();
  }

  @override
  Future<List<PokemonEntity>> searchPokemons(String query) async {
    return (_db.select(_db.pokemons)
          ..where((t) => t.name.contains(query.toLowerCase())))
        .get();
  }

  @override
  Future<void> toggleSavePokemon(int id, bool isSaved) {
    return (_db.update(_db.pokemons)..where((t) => t.id.equals(id)))
        .write(PokemonsCompanion(isSaved: d.Value(isSaved)));
  }

  @override
  Future<List<PokemonEntity>> getSavedPokemons() {
    return (_db.select(_db.pokemons)..where((t) => t.isSaved.equals(true)))
        .get();
  }
}
