import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation_app/providers/language_provider.dart';
import 'package:translation_app/utils/colors.dart';

class Language extends StatefulWidget {
  String default_lan;
  String mark;
  Language({super.key, required this.mark, required this.default_lan});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String txt = "English";
  final List<String> languages = [
    "English",
    "Spanish",
    "French",
    "German",
  ];

  void change_language(BuildContext context, String check, String value) {
    final languageControl = context.read<LanguageControlProvider>();

    if (check == "from") {
      languageControl.setFromLanguage(value);
    } else if (check == "to") {
      languageControl.setToLanguages([value]);
    } else {
      languageControl.setFromLanguage("hello");
      languageControl.setToLanguages(["hiiii"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        _showAlertDialog(context);
      },
      child: Container(
        height: h * 0.055,
        width: w * 0.3,
        decoration: BoxDecoration(
            color: colors.vintage, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: colors.black),
        )),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: colors.military,
          title: Text(
            'Select a Language',
            style: TextStyle(
              color: colors.base,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              itemBuilder: (BuildContext context, int index) {
                return SimpleDialogOption(
                  onPressed: () {
                    change_language(context, widget.mark, languages[index]);
                    setState(() {
                      txt = languages[index];
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    languages[index],
                    style: TextStyle(
                        color: colors.base,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
