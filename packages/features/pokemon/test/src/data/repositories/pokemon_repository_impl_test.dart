/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Tests for PokemonRepositoryImpl updated with memory-only list logic. */

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/data/local/pokemon_database.dart';
import 'package:pokemon/src/data/local/pokemon_local_data_source.dart';
import 'package:pokemon/src/data/remote/pokemon_remote_data_source.dart';
import 'package:pokemon/src/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/src/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/src/data/models/pokemon_dto.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart' as dom;

class MockRemoteDataSource extends Mock implements PokemonRemoteDataSource {}

class MockLocalDataSource extends Mock implements PokemonLocalDataSource {}

class FakePokemonsCompanion extends Fake implements PokemonsCompanion {}

void main() {
  late PokemonRepository repository;
  late MockRemoteDataSource remoteDataSource;
  late MockLocalDataSource localDataSource;

  setUpAll(() {
    registerFallbackValue(FakePokemonsCompanion());
  });

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();
    repository = PokemonRepositoryImpl(remoteDataSource, localDataSource);
  });

  group('getPokemonList', () {
    test('should fetch from remote and check saved status from DB', () async {
      final mockDtos = [
        const PokemonDto(id: 1, name: 'bulbasaur'),
        const PokemonDto(id: 2, name: 'ivysaur'),
      ];

      when(() => remoteDataSource.getPokemonList(limit: 10, offset: 0))
          .thenAnswer((_) async => mockDtos);
      
      when(() => localDataSource.getSavedPokemons())
          .thenAnswer((_) async => []);

      final result = await repository.getPokemonList(limit: 10, offset: 0);

      expect(result, isA<Success>());
      verify(() => remoteDataSource.getPokemonList(limit: 10, offset: 0)).called(1);
      verify(() => localDataSource.getSavedPokemons()).called(1);
    });
  });

  group('toggleSavePokemon', () {
    test('should use upsert to persist full pokemon data', () async {
      final pokemonEntity = PokemonEntity(
        id: 1,
        name: 'bulbasaur',
        imageUrl: '',
        types: 'grass',
        abilities: 'overgrow',
        isSaved: false,
      );

      final domain = dom.Pokemon(
        id: 1,
        name: 'bulbasaur',
        imageUrl: '',
        types: ['grass'],
        abilities: ['overgrow'],
        isSaved: false,
      );

      when(() => localDataSource.getPokemonByIdOrName('1'))
          .thenAnswer((_) async => pokemonEntity);
      when(() => localDataSource.upsertPokemon(any()))
          .thenAnswer((_) async => {});

      await repository.toggleSavePokemon(domain);

      verify(() => localDataSource.upsertPokemon(any())).called(1);
    });
  });
}
