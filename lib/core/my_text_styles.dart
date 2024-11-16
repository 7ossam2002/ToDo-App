

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
    color: ColorsManager.dateColor,
  );

  static TextStyle? bottomSheetTaskStyles =

  GoogleFonts.aBeeZee(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Color(0xFF383838),
  );

  static TextStyle? greyHint =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFA9A9A9),
  );

  static TextStyle? lightTaskTitle =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManager.whiteColor,
  );


  static TextStyle? lightDateStyle =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManager.whiteColor,
  );

  static TextStyle? dropDownItems =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

}




class MyDarkTextStyles{
  static TextStyle? appBarTextStyles =TextStyle(
    color: ColorsManager.deepPurColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle? cardTextStyles =TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorsManager.darkTask
  );
  static TextStyle? settingsItemTextStyles =

  GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: ColorsManager.whiteColor,
  );

  static TextStyle? bottomSheetTaskStyles =

  GoogleFonts.aBeeZee(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Color(0xFF383838),
  );

  static TextStyle? greyHint =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFA9A9A9),
  );

  static TextStyle? darkTaskTitle =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blueColor,
  );


  static TextStyle? darkDateStyle =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManager.whiteColor ,
  );

  static TextStyle? dropDownItems =

  GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

}