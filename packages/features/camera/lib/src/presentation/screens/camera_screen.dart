/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Dedicated screen for camera identification. */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../notifiers/pokemon_camera_notifier.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonCameraNotifierProvider.notifier).identifyFromCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraMessage = ref.watch(cameraMessageProvider);

    ref.listen(pokemonCameraNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (pokemon) {
          if (pokemon != null) {
            context.pushReplacement('/detail/${pokemon.id}', extra: pokemon);
          }
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error identifying Pokemon: $err')),
          );
          if (context.mounted) context.pop();
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: Colors.white),
            const SizedBox(height: 24),
            Text(
              cameraMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('CANCELAR', style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
