import 'package:flutter/material.dart';

class LanguageControlProvider extends ChangeNotifier {
  String fromLanguage = "English";
  List<String> toLanguages = ["German"];
  String fromLanguageCode = "en";
  List<String> toLanguagesCode = ["en"];

  Map<String, String> languages = {
    'German': 'de',
    'Hindi': 'hi',
    'Spanish': 'es',
    'French': 'fr',
    'Chinese': 'zh',
    'English': 'en',
    // Add more languages as needed
  };

  void setFromLanguage(String newLanguage) {
    fromLanguage = newLanguage;
    fromLanguageCode = languages[fromLanguage] ?? "en";
    notifyListeners();
  }

  void setToLanguages(List<String> newLanguages) {
    toLanguages = newLanguages;
    toLanguagesCode[0] = languages[toLanguages] ?? "de";
    notifyListeners();
  }
}
