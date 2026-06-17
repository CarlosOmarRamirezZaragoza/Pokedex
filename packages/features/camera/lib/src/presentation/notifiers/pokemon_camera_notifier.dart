/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Notifier for camera-based Pokemon identification. */

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokemon/src/domain/entities/pokemon.dart';
import '../../domain/usecases/identify_pokemon_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_camera_notifier.g.dart';

@riverpod
class CameraMessage extends _$CameraMessage {
  @override
  String build() => '';

  void setMessage(String msg) => state = msg;
}

@riverpod
class PokemonCameraNotifier extends _$PokemonCameraNotifier {
  final ImagePicker _picker = ImagePicker();

  @override
  AsyncValue<Pokemon?> build() => const AsyncData(null);

  Future<void> identifyFromCamera() async {
    ref.read(cameraMessageProvider.notifier).setMessage('Abriendo camara...');
    state = const AsyncLoading();
    
    try {
      final photo = await _picker.pickImage(source: ImageSource.camera);
      
      if (photo == null) {
        state = const AsyncData(null);
        return;
      }

      ref.read(cameraMessageProvider.notifier).setMessage('Identificando Pokemon...');
      final bytes = await photo.readAsBytes();
      final useCase = GetIt.I<IdentifyPokemonUseCase>();
      final result = await useCase.execute(bytes);

      result.when(
        success: (pokemon) {
          if (pokemon.name == 'unknown') {
            state = AsyncError('Could not identify Pokemon', StackTrace.current);
          } else {
            state = AsyncData(pokemon);
          }
        },
        failure: (error) {
          state = AsyncError(error.toString(), StackTrace.current);
        },
      );
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
