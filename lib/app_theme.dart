import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0XFFB7935F);
  static const Color darkPrimary = Color(0XFF141A2E);
  static const Color white = Color(0XFFF8F8F8);
  static const Color dark = Color(0XFF242424);
  static const Color gold = Color(0XFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightPrimary,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(primaryColor: darkPrimary);
}
