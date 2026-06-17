/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Tests for PokemonRemoteDataSource. */

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/data/remote/pokemon_remote_data_source.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late PokemonRemoteDataSource dataSource;
  late MockDio dio;

  setUp(() {
    dio = MockDio();
    dataSource = PokemonRemoteDataSourceImpl(dio);
  });

  group('getPokemonList', () {
    test('should return list of PokemonDto when status code is 200', () async {
      when(() => dio.get<Map<String, dynamic>>(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: {
                  'results': [
                    {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'}
                  ]
                },
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      final result = await dataSource.getPokemonList(limit: 10, offset: 0);

      expect(result.length, 1);
      expect(result.first.name, 'bulbasaur');
    });
  });
}
