// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database.dart';

// ignore_for_file: type=lint
class $PokemonsTable extends Pokemons
    with TableInfo<$PokemonsTable, PokemonEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedColumn<String> types = GeneratedColumn<String>(
      'types', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _abilitiesMeta =
      const VerificationMeta('abilities');
  @override
  late final GeneratedColumn<String> abilities = GeneratedColumn<String>(
      'abilities', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
      'is_saved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_saved" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, imageUrl, types, abilities, isSaved];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemons';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('types')) {
      context.handle(
          _typesMeta, types.isAcceptableOrUnknown(data['types']!, _typesMeta));
    } else if (isInserting) {
      context.missing(_typesMeta);
    }
    if (data.containsKey('abilities')) {
      context.handle(_abilitiesMeta,
          abilities.isAcceptableOrUnknown(data['abilities']!, _abilitiesMeta));
    } else if (isInserting) {
      context.missing(_abilitiesMeta);
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      types: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}types'])!,
      abilities: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}abilities'])!,
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved'])!,
    );
  }

  @override
  $PokemonsTable createAlias(String alias) {
    return $PokemonsTable(attachedDatabase, alias);
  }
}

class PokemonEntity extends DataClass implements Insertable<PokemonEntity> {
  final int id;
  final String name;
  final String imageUrl;
  final String types;
  final String abilities;
  final bool isSaved;
  const PokemonEntity(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.types,
      required this.abilities,
      required this.isSaved});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['types'] = Variable<String>(types);
    map['abilities'] = Variable<String>(abilities);
    map['is_saved'] = Variable<bool>(isSaved);
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: Value(imageUrl),
      types: Value(types),
      abilities: Value(abilities),
      isSaved: Value(isSaved),
    );
  }

  factory PokemonEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      types: serializer.fromJson<String>(json['types']),
      abilities: serializer.fromJson<String>(json['abilities']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'types': serializer.toJson<String>(types),
      'abilities': serializer.toJson<String>(abilities),
      'isSaved': serializer.toJson<bool>(isSaved),
    };
  }

  PokemonEntity copyWith(
          {int? id,
          String? name,
          String? imageUrl,
          String? types,
          String? abilities,
          bool? isSaved}) =>
      PokemonEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        types: types ?? this.types,
        abilities: abilities ?? this.abilities,
        isSaved: isSaved ?? this.isSaved,
      );
  PokemonEntity copyWithCompanion(PokemonsCompanion data) {
    return PokemonEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      types: data.types.present ? data.types.value : this.types,
      abilities: data.abilities.present ? data.abilities.value : this.abilities,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('types: $types, ')
          ..write('abilities: $abilities, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, imageUrl, types, abilities, isSaved);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.types == this.types &&
          other.abilities == this.abilities &&
          other.isSaved == this.isSaved);
}

class PokemonsCompanion extends UpdateCompanion<PokemonEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> types;
  final Value<String> abilities;
  final Value<bool> isSaved;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.types = const Value.absent(),
    this.abilities = const Value.absent(),
    this.isSaved = const Value.absent(),
  });
  PokemonsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String imageUrl,
    required String types,
    required String abilities,
    this.isSaved = const Value.absent(),
  })  : name = Value(name),
        imageUrl = Value(imageUrl),
        types = Value(types),
        abilities = Value(abilities);
  static Insertable<PokemonEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? types,
    Expression<String>? abilities,
    Expression<bool>? isSaved,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (types != null) 'types': types,
      if (abilities != null) 'abilities': abilities,
      if (isSaved != null) 'is_saved': isSaved,
    });
  }

  PokemonsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<String>? types,
      Value<String>? abilities,
      Value<bool>? isSaved}) {
    return PokemonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (types.present) {
      map['types'] = Variable<String>(types.value);
    }
    if (abilities.present) {
      map['abilities'] = Variable<String>(abilities.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('types: $types, ')
          ..write('abilities: $abilities, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }
}

class $PokemonSearchTable extends PokemonSearch
    with TableInfo<$PokemonSearchTable, PokemonSearchData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonSearchTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, pokemonId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_search';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonSearchData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PokemonSearchData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonSearchData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
    );
  }

  @override
  $PokemonSearchTable createAlias(String alias) {
    return $PokemonSearchTable(attachedDatabase, alias);
  }
}

class PokemonSearchData extends DataClass
    implements Insertable<PokemonSearchData> {
  final String name;
  final int pokemonId;
  const PokemonSearchData({required this.name, required this.pokemonId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['pokemon_id'] = Variable<int>(pokemonId);
    return map;
  }

  PokemonSearchCompanion toCompanion(bool nullToAbsent) {
    return PokemonSearchCompanion(
      name: Value(name),
      pokemonId: Value(pokemonId),
    );
  }

  factory PokemonSearchData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonSearchData(
      name: serializer.fromJson<String>(json['name']),
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'pokemonId': serializer.toJson<int>(pokemonId),
    };
  }

  PokemonSearchData copyWith({String? name, int? pokemonId}) =>
      PokemonSearchData(
        name: name ?? this.name,
        pokemonId: pokemonId ?? this.pokemonId,
      );
  PokemonSearchData copyWithCompanion(PokemonSearchCompanion data) {
    return PokemonSearchData(
      name: data.name.present ? data.name.value : this.name,
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonSearchData(')
          ..write('name: $name, ')
          ..write('pokemonId: $pokemonId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, pokemonId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonSearchData &&
          other.name == this.name &&
          other.pokemonId == this.pokemonId);
}

class PokemonSearchCompanion extends UpdateCompanion<PokemonSearchData> {
  final Value<String> name;
  final Value<int> pokemonId;
  final Value<int> rowid;
  const PokemonSearchCompanion({
    this.name = const Value.absent(),
    this.pokemonId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonSearchCompanion.insert({
    required String name,
    required int pokemonId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        pokemonId = Value(pokemonId);
  static Insertable<PokemonSearchData> custom({
    Expression<String>? name,
    Expression<int>? pokemonId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonSearchCompanion copyWith(
      {Value<String>? name, Value<int>? pokemonId, Value<int>? rowid}) {
    return PokemonSearchCompanion(
      name: name ?? this.name,
      pokemonId: pokemonId ?? this.pokemonId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonSearchCompanion(')
          ..write('name: $name, ')
          ..write('pokemonId: $pokemonId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PokemonDatabase extends GeneratedDatabase {
  _$PokemonDatabase(QueryExecutor e) : super(e);
  $PokemonDatabaseManager get managers => $PokemonDatabaseManager(this);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  late final $PokemonSearchTable pokemonSearch = $PokemonSearchTable(this);
  late final Index pokemonNameIdx = Index('pokemon_name_idx',
      'CREATE INDEX pokemon_name_idx ON pokemon_search (name)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pokemons, pokemonSearch, pokemonNameIdx];
}

typedef $$PokemonsTableCreateCompanionBuilder = PokemonsCompanion Function({
  Value<int> id,
  required String name,
  required String imageUrl,
  required String types,
  required String abilities,
  Value<bool> isSaved,
});
typedef $$PokemonsTableUpdateCompanionBuilder = PokemonsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> imageUrl,
  Value<String> types,
  Value<String> abilities,
  Value<bool> isSaved,
});

class $$PokemonsTableFilterComposer
    extends Composer<_$PokemonDatabase, $PokemonsTable> {
  $$PokemonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get types => $composableBuilder(
      column: $table.types, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get abilities => $composableBuilder(
      column: $table.abilities, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSaved => $composableBuilder(
      column: $table.isSaved, builder: (column) => ColumnFilters(column));
}

class $$PokemonsTableOrderingComposer
    extends Composer<_$PokemonDatabase, $PokemonsTable> {
  $$PokemonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get types => $composableBuilder(
      column: $table.types, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get abilities => $composableBuilder(
      column: $table.abilities, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSaved => $composableBuilder(
      column: $table.isSaved, builder: (column) => ColumnOrderings(column));
}

class $$PokemonsTableAnnotationComposer
    extends Composer<_$PokemonDatabase, $PokemonsTable> {
  $$PokemonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get types =>
      $composableBuilder(column: $table.types, builder: (column) => column);

  GeneratedColumn<String> get abilities =>
      $composableBuilder(column: $table.abilities, builder: (column) => column);

  GeneratedColumn<bool> get isSaved =>
      $composableBuilder(column: $table.isSaved, builder: (column) => column);
}

class $$PokemonsTableTableManager extends RootTableManager<
    _$PokemonDatabase,
    $PokemonsTable,
    PokemonEntity,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (
      PokemonEntity,
      BaseReferences<_$PokemonDatabase, $PokemonsTable, PokemonEntity>
    ),
    PokemonEntity,
    PrefetchHooks Function()> {
  $$PokemonsTableTableManager(_$PokemonDatabase db, $PokemonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> types = const Value.absent(),
            Value<String> abilities = const Value.absent(),
            Value<bool> isSaved = const Value.absent(),
          }) =>
              PokemonsCompanion(
            id: id,
            name: name,
            imageUrl: imageUrl,
            types: types,
            abilities: abilities,
            isSaved: isSaved,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String imageUrl,
            required String types,
            required String abilities,
            Value<bool> isSaved = const Value.absent(),
          }) =>
              PokemonsCompanion.insert(
            id: id,
            name: name,
            imageUrl: imageUrl,
            types: types,
            abilities: abilities,
            isSaved: isSaved,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PokemonsTableProcessedTableManager = ProcessedTableManager<
    _$PokemonDatabase,
    $PokemonsTable,
    PokemonEntity,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (
      PokemonEntity,
      BaseReferences<_$PokemonDatabase, $PokemonsTable, PokemonEntity>
    ),
    PokemonEntity,
    PrefetchHooks Function()>;
typedef $$PokemonSearchTableCreateCompanionBuilder = PokemonSearchCompanion
    Function({
  required String name,
  required int pokemonId,
  Value<int> rowid,
});
typedef $$PokemonSearchTableUpdateCompanionBuilder = PokemonSearchCompanion
    Function({
  Value<String> name,
  Value<int> pokemonId,
  Value<int> rowid,
});

class $$PokemonSearchTableFilterComposer
    extends Composer<_$PokemonDatabase, $PokemonSearchTable> {
  $$PokemonSearchTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pokemonId => $composableBuilder(
      column: $table.pokemonId, builder: (column) => ColumnFilters(column));
}

class $$PokemonSearchTableOrderingComposer
    extends Composer<_$PokemonDatabase, $PokemonSearchTable> {
  $$PokemonSearchTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pokemonId => $composableBuilder(
      column: $table.pokemonId, builder: (column) => ColumnOrderings(column));
}

class $$PokemonSearchTableAnnotationComposer
    extends Composer<_$PokemonDatabase, $PokemonSearchTable> {
  $$PokemonSearchTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get pokemonId =>
      $composableBuilder(column: $table.pokemonId, builder: (column) => column);
}

class $$PokemonSearchTableTableManager extends RootTableManager<
    _$PokemonDatabase,
    $PokemonSearchTable,
    PokemonSearchData,
    $$PokemonSearchTableFilterComposer,
    $$PokemonSearchTableOrderingComposer,
    $$PokemonSearchTableAnnotationComposer,
    $$PokemonSearchTableCreateCompanionBuilder,
    $$PokemonSearchTableUpdateCompanionBuilder,
    (
      PokemonSearchData,
      BaseReferences<_$PokemonDatabase, $PokemonSearchTable, PokemonSearchData>
    ),
    PokemonSearchData,
    PrefetchHooks Function()> {
  $$PokemonSearchTableTableManager(
      _$PokemonDatabase db, $PokemonSearchTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonSearchTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonSearchTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonSearchTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<int> pokemonId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonSearchCompanion(
            name: name,
            pokemonId: pokemonId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String name,
            required int pokemonId,
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonSearchCompanion.insert(
            name: name,
            pokemonId: pokemonId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PokemonSearchTableProcessedTableManager = ProcessedTableManager<
    _$PokemonDatabase,
    $PokemonSearchTable,
    PokemonSearchData,
    $$PokemonSearchTableFilterComposer,
    $$PokemonSearchTableOrderingComposer,
    $$PokemonSearchTableAnnotationComposer,
    $$PokemonSearchTableCreateCompanionBuilder,
    $$PokemonSearchTableUpdateCompanionBuilder,
    (
      PokemonSearchData,
      BaseReferences<_$PokemonDatabase, $PokemonSearchTable, PokemonSearchData>
    ),
    PokemonSearchData,
    PrefetchHooks Function()>;

class $PokemonDatabaseManager {
  final _$PokemonDatabase _db;
  $PokemonDatabaseManager(this._db);
  $$PokemonsTableTableManager get pokemons =>
      $$PokemonsTableTableManager(_db, _db.pokemons);
  $$PokemonSearchTableTableManager get pokemonSearch =>
      $$PokemonSearchTableTableManager(_db, _db.pokemonSearch);
}
