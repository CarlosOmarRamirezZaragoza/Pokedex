/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Main DI entry point for the application.
 * Relevant Info: Aggregates all micro-packages. */

import 'package:pokedex/src/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: true,
)
Future<void> configureDependencies() => getIt.init();
