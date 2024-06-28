import 'package:flutter/material.dart';

class colors {
  static Color prim = Color(0xFF788672);
  static Color base = Color(0xFFDDDFD7);
  static Color black = Color(0xFF091410);
  static Color prim2 = Color(0xFFA8ADA7);
  static Color vintage = Color(0xFFD1C8B5);
  static Color military = Color(0xFF2D4C42);
  static Color grey = Color(0xFF56625E);
  // static Color base = Color(0xFFDDDFD7);
}


// import 'package:flutter/material.dart';
// import 'package:the_translation_app/utils/colors.dart';

// class Language extends StatefulWidget {
//   final String text ;
//   const Language({super.key, required this.text});

//   @override
//   State<Language> createState() => _LanguageState();
// }

// class _LanguageState extends State<Language> {
//   String txt = "";
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: () {
        
//       },
//       child: Container(
//         height: h * 0.055,
//         width: w * 0.3,
//         decoration: BoxDecoration(
//             color: colors.vintage, borderRadius: BorderRadius.circular(8)),
//         child: Center(
//             child: Text(
//           txt,
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//         )),
//       ),
//     );
//   }
// }

