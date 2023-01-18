import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:

  AppBarTheme(
      iconTheme: IconThemeData(
          color: Colors.blueGrey[900]
      ),
      titleSpacing: 20,
      actionsIconTheme: IconThemeData(
          color: Colors.blueGrey[900]
      ),
      color: Colors.white,
      elevation: 0,
      //  backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Jannah',
  expansionTileTheme: const ExpansionTileThemeData(
    textColor: Colors.black,
    collapsedIconColor: Colors.black,
    collapsedTextColor: Colors.black,

  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontSize: 18
    ),
    titleTextStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontSize: 22,
        fontWeight: FontWeight.bold
    ),
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    clipBehavior: Clip.antiAlias,
    elevation: 10
  ),
  iconTheme: IconThemeData(
    color: Colors.blueGrey[600],
  ),
    tabBarTheme: TabBarTheme(
        labelColor: Colors.blueGrey,
        unselectedLabelColor: Colors.grey,


    )

);

ThemeData darkTheme = ThemeData(
  primaryColorDark:  Colors.blueGrey[600],
  scaffoldBackgroundColor: HexColor("#161515"),
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      actionsIconTheme: const IconThemeData(
          color: Colors.white
      ),
      color: HexColor("#161515"),
      elevation: 0,
      //    backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#161515"),
          statusBarIconBrightness: Brightness.light
      ),
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: HexColor("#161515"),


  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Jannah',
  iconTheme: const IconThemeData(
      color: Colors.white
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    textColor: Colors.white,
    collapsedTextColor: Colors.white,
    collapsedIconColor: Colors.white,

  ),
  dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: HexColor("#161515"),
      contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18
      )
  ),
  cardTheme:  CardTheme(
      color: HexColor("#161515"),
      clipBehavior: Clip.antiAlias,
      elevation: 15,
    shadowColor: HexColor("#161000")
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey
  )
);