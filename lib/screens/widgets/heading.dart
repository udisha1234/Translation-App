import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  final String text1;
  final String mark;
  const Heading({super.key, required this.text1, required this.mark});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text1),
      ],
    );
  }
}
