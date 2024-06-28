import 'dart:convert';
class Translation {
  
  final String translatedText;
  final String detectedSourceLanguage;

  Translation({required this.translatedText, required this.detectedSourceLanguage});

  factory Translation.fromJson(Map<String, dynamic> json) {
    print("1");
    return Translation(
      translatedText: json['texts'] ?? 'No translation found',
      detectedSourceLanguage: json['detectedSourceLanguage'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'translatedText': translatedText,
      'detectedSourceLanguage': detectedSourceLanguage,
    };
  }

  static List<Translation> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Translation.fromJson(json)).toList();
  }

  static String encode(List<Translation> translations) {
    return json.encode(
      translations.map<Map<String, dynamic>>((translation) => translation.toJson()).toList(),
    );
  }

  static List<Translation> decode(String translations) {
    return (json.decode(translations) as List<dynamic>)
        .map<Translation>((item) => Translation.fromJson(item))
        .toList();
  }
}
