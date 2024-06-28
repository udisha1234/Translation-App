import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation_app/providers/language_provider.dart';
import 'package:translation_app/providers/translation_provider.dart';
import 'package:translation_app/screens/home_screen.dart';
import 'package:translation_app/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TranslationProvider()),
        ChangeNotifierProvider(create: (_) => LanguageControlProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translate App',
      home:SplashScreen() ,
    );
  }
}
