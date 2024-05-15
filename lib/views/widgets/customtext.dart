import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double fontsize;
  final Color labelColor;
  final FontWeight fontWeight;
  final TextDecoration decoration;
  final String fontFamily;
  final double letterSpacing;
  final double wordSpacing;
  final TextOverflow overflow;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.label,
    this.fontsize = 16,
    this.labelColor = appbartextColor,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.fontFamily = "", // Specify font family if desired
    this.letterSpacing = 0.0,
    this.wordSpacing = 0.0,
    this.overflow = TextOverflow.clip, // Adjust overflow behavior
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontsize,
        color: labelColor,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily.isEmpty ? null : fontFamily,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
