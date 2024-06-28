import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget {
  final double w;
  App_Bar(this.w);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/icon_1_translate.png"),
          const Text(
            "Translate  ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const Icon(
            Icons.notifications_none_rounded,
            size: 30,
          )
        ],
      ),
    );
  }
}
// pP