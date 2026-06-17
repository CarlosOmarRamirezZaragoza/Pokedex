//@GeneratedMicroModule;CorePackageModule;package:core/src/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/src/di/injection.dart' as _i603;
import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;

class CorePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final coreModule = _$CoreModule();
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
  }
}

class _$CoreModule extends _i603.CoreModule {}
