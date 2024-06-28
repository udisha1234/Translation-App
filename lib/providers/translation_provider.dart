import 'package:flutter/material.dart';
import 'package:translation_app/models/translation_model.dart';
import 'package:translation_app/services/api_services.dart';

class TranslationProvider with ChangeNotifier {
  List<Translation>? _translations;
  bool _isLoading = false;

  List<Translation>? get translations => _translations;
  bool get isLoading => _isLoading;

  Future<void> translateText(
      List<String> texts, List<String> toLanguages, String fromLanguage) async {
    _isLoading = true;
    notifyListeners();

    try {
      _translations =
          await TranslationService.translate(texts, toLanguages, fromLanguage);
      notifyListeners();
    } catch (error) {
      // Handle translation error
      print("Error occurred during translation: $error");
      _translations = null; // Reset translations if error occurs
    }

    _isLoading = false;
    notifyListeners();
  }
}
