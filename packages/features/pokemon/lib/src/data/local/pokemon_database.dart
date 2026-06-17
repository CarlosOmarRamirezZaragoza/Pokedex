/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Local database for Pokemon caching with FTS5 search. */

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'pokemon_database.g.dart';

@DataClassName('PokemonEntity')
class Pokemons extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get imageUrl => text()();
  TextColumn get types => text()(); // Store as comma-separated string
  TextColumn get abilities => text()(); // Store as comma-separated string
  BoolColumn get isSaved => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// FTS5 Table for fast searching
@TableIndex(name: 'pokemon_name_idx', columns: {#name})
class PokemonSearch extends Table {
  TextColumn get name => text()();
  IntColumn get pokemonId => integer()();
}

@DriftDatabase(tables: [Pokemons, PokemonSearch])
class PokemonDatabase extends _$PokemonDatabase {
  PokemonDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'pokemon.db'));
      return NativeDatabase(file);
    });
  }
}
