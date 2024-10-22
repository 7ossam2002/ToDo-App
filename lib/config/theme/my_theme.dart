

import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.blueColor,

    cardTheme: CardTheme(
      elevation: 0
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // margin: EdgeInsets.symmetric(vertical: 30,),
      // color: ColorsManager.whiteColor,

    ),
    dividerColor: ColorsManager.blueColor,
    indicatorColor: ColorsManager.whiteColor,
    appBarTheme:  AppBarTheme(
     // toolbarHeight: 60,
      backgroundColor: ColorsManager.blueColor,
      centerTitle: true,
      elevation: 4,
      titleTextStyle: MyTextStyles.appBarTextStyles,

    ),
      scaffoldBackgroundColor: ColorsManager.scaffold,
      bottomAppBarTheme: BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
        elevation: 16,
        color: ColorsManager.whiteColor,
      ),
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        elevation: 0,
      backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.blueColor,
        unselectedItemColor: ColorsManager.greyColor,
        selectedIconTheme: IconThemeData(
          size: 30,
        )
  ),
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
      shape: StadiumBorder(
  side: BorderSide(color: Colors.white,width: 3),

  ),
        backgroundColor: ColorsManager.blueColor,
        elevation: 12
  ),

      textTheme: TextTheme(
      titleMedium: MyTextStyles.cardTextStyles,
       labelSmall: MyTextStyles.settingsItemTextStyles,
  )

  );
}