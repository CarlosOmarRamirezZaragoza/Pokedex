//@GeneratedMicroModule;PokemonPackageModule;package:pokemon/src/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokemon/src/data/local/pokemon_database.dart' as _i819;
import 'package:pokemon/src/data/local/pokemon_local_data_source.dart' as _i510;
import 'package:pokemon/src/data/remote/pokemon_remote_data_source.dart'
    as _i831;
import 'package:pokemon/src/data/repositories/pokemon_repository_impl.dart'
    as _i155;
import 'package:pokemon/src/di/pokemon_module.dart' as _i699;
import 'package:pokemon/src/domain/repositories/pokemon_repository.dart'
    as _i968;
import 'package:pokemon/src/domain/usecases/get_pokemon_detail_use_case.dart'
    as _i198;
import 'package:pokemon/src/domain/usecases/get_pokemon_list_use_case.dart'
    as _i1045;
import 'package:pokemon/src/domain/usecases/get_pokemon_slim_detail_use_case.dart'
    as _i952;
import 'package:pokemon/src/domain/usecases/get_saved_pokemons_use_case.dart'
    as _i591;
import 'package:pokemon/src/domain/usecases/toggle_save_pokemon_use_case.dart'
    as _i317;

class PokemonPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final pokemonModule = _$PokemonModule();
    gh.lazySingleton<_i819.PokemonDatabase>(() => pokemonModule.database);
    gh.lazySingleton<_i831.PokemonRemoteDataSource>(
        () => _i831.PokemonRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i510.PokemonLocalDataSource>(
        () => _i510.PokemonLocalDataSourceImpl(gh<_i819.PokemonDatabase>()));
    gh.lazySingleton<_i968.PokemonRepository>(() => _i155.PokemonRepositoryImpl(
          gh<_i831.PokemonRemoteDataSource>(),
          gh<_i510.PokemonLocalDataSource>(),
        ));
    gh.lazySingleton<_i198.GetPokemonDetailUseCase>(
        () => _i198.GetPokemonDetailUseCase(gh<_i968.PokemonRepository>()));
    gh.lazySingleton<_i1045.GetPokemonListUseCase>(
        () => _i1045.GetPokemonListUseCase(gh<_i968.PokemonRepository>()));
    gh.lazySingleton<_i591.GetSavedPokemonsUseCase>(
        () => _i591.GetSavedPokemonsUseCase(gh<_i968.PokemonRepository>()));
    gh.lazySingleton<_i317.ToggleSavePokemonUseCase>(
        () => _i317.ToggleSavePokemonUseCase(gh<_i968.PokemonRepository>()));
    gh.lazySingleton<_i952.GetPokemonSlimDetailUseCase>(
        () => _i952.GetPokemonSlimDetailUseCase(gh<_i968.PokemonRepository>()));
  }
}

class _$PokemonModule extends _i699.PokemonModule {}
