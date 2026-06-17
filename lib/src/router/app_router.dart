/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Global router configuration using GoRouter.
 * Relevant Info: Centralizes all routes. */

import 'package:go_router/go_router.dart';
import 'package:pokemon/pokemon.dart';
import 'package:camera/camera.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PokemonScreen(),
      routes: [
        GoRoute(
          path: 'camera',
          builder: (context, state) => const CameraScreen(),
        ),
        GoRoute(
          path: 'detail/:idOrName',
          builder: (context, state) {
            final idOrName = state.pathParameters['idOrName']!;
            final pokemon = state.extra as Pokemon?;
            return PokemonDetailScreen(idOrName: idOrName, pokemon: pokemon);
          },
        ),
      ],
    ),
  ],
);
