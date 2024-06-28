import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translation_app/models/translation_model.dart';

class TranslationService {
  static const String _apiHost = 'ai-translate.p.rapidapi.com';
  static const String _apiKey =
      '9c21df4496msh3dc19d82347c981p150c0fjsn21e47d9c3af8';

  static Future<List<Translation>> translate(
      List<String> texts, List<String> toLanguages, String fromLanguage) async {
    final uri = Uri.https(_apiHost, '/translates');

    // final textToTranslate = targetTextController.text;
    final headers = {
      'Content-Type': 'application/json',
      'x-rapidapi-host': _apiHost,
      'x-rapidapi-key': _apiKey,
    };

    final body = jsonEncode({
      'texts': texts,
      'tls': toLanguages,
      'sl': fromLanguage,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as List<dynamic>;
        // print(response.body);
        print('Parsed JSON Response: $jsonResponse');
        return jsonResponse.map((json) => Translation.fromJson(json)).toList();
      } else {
        print('Error occurred: ${response.body}');
        throw Exception('Failed to translate text');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to translate text');
    }
  }
}
