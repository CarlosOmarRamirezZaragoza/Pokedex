/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Tests for GetPokemonDetailUseCase. */

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import 'package:pokemon/src/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_detail_use_case.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late GetPokemonDetailUseCase useCase;
  late MockPokemonRepository repository;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = GetPokemonDetailUseCase(repository);
  });

  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: '',
    types: [],
    abilities: [],
  );

  test('should call getPokemonDetail from repository', () async {
    when(() => repository.getPokemonDetail(any()))
        .thenAnswer((_) async => const Success(tPokemon));

    final result = await useCase.execute('bulbasaur');

    expect(result, isA<Success<Pokemon>>());
    verify(() => repository.getPokemonDetail('bulbasaur')).called(1);
  });
}
