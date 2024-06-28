import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation_app/providers/language_provider.dart';
import 'package:translation_app/providers/translation_provider.dart';
import 'package:translation_app/screens/widgets/appbar.dart';
import 'package:translation_app/screens/widgets/from_and_to.dart';
import 'package:translation_app/screens/widgets/heading.dart';
import 'package:translation_app/utils/colors.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  // String text = "You'll see the translation here...";
  // final languageControl = context.read<LanguageControlProvider>();
  TextEditingController targetTextController = TextEditingController();
  String fromLanguage =
      LanguageControlProvider().fromLanguageCode; // Default from language
  List<String> toLanguages =
      LanguageControlProvider().toLanguagesCode; // Default to languages

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: colors.base,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: h * 0.02, vertical: h * 0.015),
              child: Column(
                children: [
                  // Customized AppBar
                  App_Bar(w),
                  // Show language from and to
                  const From_and_To(),

                  // Heading
                  const Heading(text1: "To translate", mark: "from"),

                  // Main block to enter text
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: Container(
                      height: h * 0.26,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colors.military,
                      ),
                      child: TextField(
                        controller: targetTextController,
                        cursorColor: colors.base,
                        style: TextStyle(
                          color: colors.base,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                        maxLines: 100,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter text...",
                          hintStyle: TextStyle(
                            color: colors.base,
                            fontWeight: FontWeight.w200,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: w * 0.04,
                            vertical: h * 0.015,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Heading(text1: "Translated text", mark: "to"),

                  // Block to see the translated text
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: Container(
                      height: h * 0.26,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colors.military,
                      ),
                      child: Consumer<TranslationProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else {
                            if (provider.translations != null) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: w * 0.04),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: provider.translations!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      provider
                                          .translations![index].translatedText,
                                      style: TextStyle(
                                        color: colors.base,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              // Handle translation error (if any)
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: w * 0.04),
                                child: Text(
                                  "Tanslation will appear here...",
                                  style: TextStyle(
                                    color: colors
                                        .base, // Indicate error with red color
                                    fontWeight: FontWeight
                                        .w300, // Emphasize error message
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.1,
                  ),
                  // Elevated Button to request the api
                  Consumer<LanguageControlProvider>(
                    builder: (context, languageControlProvider, child) {
                      return Container(
                        width: w,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              languageControlProvider.fromLanguageCode =
                                  languageControlProvider.languages[
                                          languageControlProvider
                                              .fromLanguage] ??
                                      "en";
                              languageControlProvider.toLanguagesCode[0] =
                                  languageControlProvider.languages[
                                          languageControlProvider
                                              .toLanguages[0]] ??
                                      "de";
                            });
                            final textToTranslate = targetTextController.text;
                            context.read<TranslationProvider>().translateText(
                                [textToTranslate],
                                languageControlProvider.toLanguagesCode,
                                languageControlProvider.fromLanguageCode);
                          },
                          style: ElevatedButton.styleFrom(
                            // Background color
                            backgroundColor: colors.vintage,
                            foregroundColor: colors.black, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05, vertical: h * 0.015),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Text('Translate'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
