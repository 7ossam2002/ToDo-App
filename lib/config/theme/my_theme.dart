

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.blueColor,

    cardTheme: CardTheme(
      elevation: 0,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // margin: EdgeInsets.symmetric(vertical: 30,),
      // color: ColorsManager.whiteColor,
      color: ColorsManager.deepPurColor,
    ),
    secondaryHeaderColor: ColorsManager.blueColor,
    primaryColorLight: ColorsManager.blackColor,
      hintColor: ColorsManager.blueColor,
      cardColor: Colors.red,
      disabledColor: ColorsManager.blueColor,
      primaryColorDark: Colors.white,
      dialogBackgroundColor: ColorsManager.blueColor,


      dividerColor: ColorsManager.blueColor,
    indicatorColor: Colors.transparent,
    appBarTheme:  AppBarTheme(
     // toolbarHeight: 60,
      backgroundColor: ColorsManager.blueColor,
      centerTitle: true,
      elevation: 4,
      titleTextStyle: MyTextStyles.appBarTextStyles,

    ),
      hoverColor: ColorsManager.blueColor,
      scaffoldBackgroundColor: ColorsManager.whiteColor,
      bottomAppBarTheme:const BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
        elevation: 16,
        color: ColorsManager.blueColor,
      ),
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        elevation: 0,
      backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.whiteColor,
     unselectedIconTheme: IconThemeData(
       size: 25
     ),
        unselectedItemColor: ColorsManager.greyColor,
        selectedIconTheme: IconThemeData(
          size: 33,
        )
  ),
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
      shape: StadiumBorder(
  side: BorderSide(color: ColorsManager.greyColor,width: 3),

  ),
        backgroundColor: ColorsManager.blueColor ,
        elevation: 12
  ),
      bottomSheetTheme:const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        )
      ),

      textTheme: TextTheme(
      titleMedium: MyTextStyles.cardTextStyles,
       labelSmall: MyTextStyles.settingsItemTextStyles,
        headlineMedium: MyTextStyles.bottomSheetTaskStyles,
  )

  );

  ////////////////////////////////////////////////////////////////////////////////////////







  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.blueColor,

    cardTheme: const CardTheme(
      elevation: 0,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // margin: EdgeInsets.symmetric(vertical: 30,),
       color: ColorsManager.darkTask

    ),
      dialogBackgroundColor: ColorsManager.darkTask,
      hoverColor: ColorsManager.blackColor,
      cardColor: Colors.white,
      disabledColor: Colors.red,
      primaryColorDark: Colors.red,

    dividerColor: ColorsManager.blueColor,
    indicatorColor: Colors.transparent,
    appBarTheme:  AppBarTheme(
     // toolbarHeight: 60,
      backgroundColor: ColorsManager.darkTask,
      centerTitle: true,
      elevation: 4  ,
      titleTextStyle: MyTextStyles.appBarTextStyles,

    ),
      primaryColorLight: ColorsManager.whiteColor,
      hintColor: ColorsManager.darkTask,

      scaffoldBackgroundColor: ColorsManager.darkCardColor,

      bottomAppBarTheme:const BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
        elevation: 16,
        color: ColorsManager.darkTask,
      ),
      secondaryHeaderColor: ColorsManager.blackColor,
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        elevation: 0,
      backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.whiteColor,
        unselectedItemColor: ColorsManager.dateColor,
        selectedIconTheme: IconThemeData(
          size: 30,
        )
  ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(
  side: BorderSide(color: Colors.white,width: 3),

  ),
        backgroundColor: ColorsManager.darkTask,
        elevation: 12
  ),
      bottomSheetTheme:const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        )
      ),

      textTheme: TextTheme(
      titleMedium: MyTextStyles.cardTextStyles,
       labelSmall: MyTextStyles.settingsItemTextStyles,
        headlineMedium: MyTextStyles.bottomSheetTaskStyles,
  )

  );
}