// CUSTOM BUTTON THEME
import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';

class CustomButtonTheme {
  //
  static ButtonStyle customStyle({
    Color color = Colors.tealAccent,
    Color borderColor = Colors.black,
    double borderRadius = 50,
    double width = 50,
    double height = 30,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      fixedSize: Size(width, height),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

//
  static ButtonStyle primaryStyle(
      {required bool isAutosize, double width = 100, double height = 50}) {
    return ElevatedButton.styleFrom(
      backgroundColor: CustomColorTheme.btnprimaryColor,
      fixedSize: isAutosize ? null : Size(width, height),
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: CustomColorTheme.btnBorderColor1, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

//
  static ButtonStyle secondaryStyle(
      {required bool isAutosize, double width = 100, double height = 50}) {
    return ElevatedButton.styleFrom(
      backgroundColor: CustomColorTheme.btnsecondaryColor,
      fixedSize: isAutosize ? null : Size(width, height),
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: CustomColorTheme.btnBorderColor2, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

//
  static ButtonStyle tritaryStyle(
      {required bool isAutosize, double width = 100, double height = 50}) {
    return ElevatedButton.styleFrom(
      backgroundColor: CustomColorTheme.errorColor,
      fixedSize: isAutosize ? null : Size(width, height),
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: CustomColorTheme.btnBorderColor3, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
