

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/colors_manager.dart';

class MyTextStyles{
  static TextStyle? appBarTextStyles =TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle? cardTextStyles =TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blueColor
  );
  static TextStyle? settingsItemTextStyles =

  GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFF303030),
  );

}