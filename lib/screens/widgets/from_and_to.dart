import 'package:flutter/material.dart';
import 'package:translation_app/screens/widgets/lang.dart';
import 'package:translation_app/utils/colors.dart';

class From_and_To extends StatefulWidget {
  const From_and_To({super.key});

  @override
  State<From_and_To> createState() => _From_and_ToState();
}

class _From_and_ToState extends State<From_and_To> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.04, bottom: h * 0.02),
      child: Container(
        width: w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Language(mark: "from", default_lan: "English"),
            Container(
              height: h * 0.055,
              width: h * 0.055,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: colors.vintage),
              child: const Center(
                  child: Icon(
                Icons.compare_arrows_rounded,
                size: 30,
              )),
            ),
            Language(
              mark: "to",
              default_lan: "German",
            )
          ],
        ),
      ),
    );
  }
}
