// TEXT STYLES
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextStyle textStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double fontsize = 18,
  }) {
    return GoogleFonts.fredoka(
        fontWeight: fontWeight, color: color, fontSize: fontsize);
  }
}
