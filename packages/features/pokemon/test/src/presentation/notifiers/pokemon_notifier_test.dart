/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Tests for PokemonNotifier. */

import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_detail_use_case.dart';
import 'package:pokemon/src/domain/usecases/get_pokemon_list_use_case.dart';
import 'package:pokemon/src/presentation/notifiers/pokemon_notifier.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}
class MockGetPokemonDetailUseCase extends Mock implements GetPokemonDetailUseCase {}

void main() {
  late MockGetPokemonListUseCase listUseCase;
  late MockGetPokemonDetailUseCase detailUseCase;

  setUp(() {
    listUseCase = MockGetPokemonListUseCase();
    detailUseCase = MockGetPokemonDetailUseCase();
  });

  ProviderContainer makeContainer() {
    final container = ProviderContainer(
      overrides: [
        getPokemonListUseCaseFactoryProvider.overrideWith((ref) => listUseCase),
        getPokemonDetailUseCaseFactoryProvider.overrideWith((ref) => detailUseCase),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('initial state should be loading and then data', () async {
    when(() => listUseCase.execute(limit: 10, offset: 0))
        .thenAnswer((_) async => const Success([]));

    final container = makeContainer();
    
    // Initial build trigger
    final notifier = container.read(pokemonNotifierProvider.notifier);
    
    await expectLater(
      container.read(pokemonNotifierProvider.future),
      completion(isEmpty),
    );
    
    verify(() => listUseCase.execute(limit: 10, offset: 0)).called(1);
  });
}
