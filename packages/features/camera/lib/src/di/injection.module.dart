//@GeneratedMicroModule;CameraPackageModule;package:camera/src/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:camera/src/data/datasources/gemini_remote_data_source.dart'
    as _i759;
import 'package:camera/src/data/repositories/gemini_repository_impl.dart'
    as _i359;
import 'package:camera/src/domain/repositories/gemini_repository.dart' as _i665;
import 'package:camera/src/domain/usecases/identify_pokemon_use_case.dart'
    as _i790;
import 'package:injectable/injectable.dart' as _i526;

class CameraPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i759.GeminiRemoteDataSource>(
        () => _i759.GeminiRemoteDataSourceImpl());
    gh.lazySingleton<_i665.GeminiRepository>(
        () => _i359.GeminiRepositoryImpl(gh<_i759.GeminiRemoteDataSource>()));
    gh.lazySingleton<_i790.IdentifyPokemonUseCase>(
        () => _i790.IdentifyPokemonUseCase(gh<_i665.GeminiRepository>()));
  }
}
