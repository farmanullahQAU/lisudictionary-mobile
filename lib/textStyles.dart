import 'package:flutter/material.dart';
import 'app_constants.dart';
import 'dart:ui' as ui;

class TextStyles {

  static TextStyle get expansionTitleStyle =>
  TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  foreground: Paint()
  ..shader = ui.Gradient.linear(
  const Offset(0, 20),
  const Offset(150, 20),
  <Color>[
  Colors.yellow,
  Colors.red,
  ],
  )
  );

  static TextStyle get wordStyle =>
      TextStyle(

          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.indigo[900]
      );
  static TextStyle get headingText2Bold => TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle get headingText2 => TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
  static TextStyle get smallBold => TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingText1(
      {FontWeight fontWeight = FontWeight.bold,
        double fontSize = 25,
        Color color = Colors.black}) =>
      TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
  static TextStyle small(
      {Color color = Colors.black, fontWeigh: FontWeight.normal}) =>
      TextStyle(
        color: color,
        fontWeight: fontWeigh,
      );
}
