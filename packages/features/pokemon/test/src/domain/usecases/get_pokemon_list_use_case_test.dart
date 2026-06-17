/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Tests for GetPokemonListUseCase. */

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_list_use_case.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late GetPokemonListUseCase useCase;
  late MockPokemonRepository repository;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = GetPokemonListUseCase(repository);
  });

  test('should call getPokemonList from repository', () async {
    when(() => repository.getPokemonList(limit: 10, offset: 0))
        .thenAnswer((_) async => const Success([]));

    final result = await useCase.execute(limit: 10, offset: 0);

    expect(result, isA<Success<List<Pokemon>>>());
    verify(() => repository.getPokemonList(limit: 10, offset: 0)).called(1);
  });
}
