import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const TextApp({
    super.key,
    this.size = 18,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'Poppin',
        fontWeight: fontWeight,
      ),
    );
  }
}