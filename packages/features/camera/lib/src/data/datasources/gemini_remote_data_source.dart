/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Data source for Gemini AI vision tasks. */

import 'dart:convert';
import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/data/models/pokemon_dto.dart';

abstract class GeminiRemoteDataSource {
  Future<PokemonDto> identifyPokemon(Uint8List imageBytes);
}

@LazySingleton(as: GeminiRemoteDataSource)
class GeminiRemoteDataSourceImpl implements GeminiRemoteDataSource {
  static const _apiKey = '';
  static const _model = 'gemini-2.5-flash';
  static const _prompt = 'Identify the Pokemon in this image. '
      'Return ONLY a JSON object with this exact structure: '
      '{"id": integer, "name": "string", "types": ["string"], "abilities": ["string"]}. '
      'If unknown, return {"id": 0, "name": "unknown", "types": [], "abilities": []}. '
      'No markdown, no extra text, just the raw JSON.';

  @override
  Future<PokemonDto> identifyPokemon(Uint8List imageBytes) async {
    final model = GenerativeModel(model: _model, apiKey: _apiKey);
    final content = [
      Content.multi([
        TextPart(_prompt),
        DataPart('image/jpeg', imageBytes),
      ])
    ];

    final response = await model.generateContent(content);
    final text = response.text?.trim() ?? '';
    
    // Clean potential markdown blocks
    final jsonString = text.replaceAll('```json', '').replaceAll('```', '').trim();
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    
    final id = jsonMap['id'] as int;
    return PokemonDto.fromJson({
      'id': id,
      'name': jsonMap['name'],
      'sprites': {
        'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'
      },
      'types': (jsonMap['types'] as List).map((t) => {'type': {'name': t}}).toList(),
      'abilities': (jsonMap['abilities'] as List).map((a) => {'ability': {'name': a}}).toList(),
    });
  }
}
