/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Application entry point.
 * Relevant Info: Initializes DI and provides the GoRouter. */

import 'package:pokedex/src/di/injection.dart';
import 'package:pokedex/src/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Dependency Injection
  await configureDependencies();

  // Limit image cache to 50MB to prevent app size bloating
  PaintingBinding.instance.imageCache.maximumSizeBytes = 50 * 1024 * 1024;

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
