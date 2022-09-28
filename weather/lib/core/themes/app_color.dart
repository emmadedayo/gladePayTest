import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppStyle{

  static textStyle(BuildContext context, Color color, double fontSize, FontWeight weight,List<Shadow>? shadow,
      {double letterSpacing = 0.1,bool isJustify = false}) {
    return GoogleFonts.overpass(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        shadows: shadow,
      ),
    );
  }
}