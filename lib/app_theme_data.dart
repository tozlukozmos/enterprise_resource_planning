import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFF273469,
      <int, Color>{
        50: Color(0xffF4F5F7),
        100: Color(0xffEAEBF0),
        200: Color(0xffD4D6E1),
        300: Color(0xffBFC3D2),
        400: Color(0xffA9AEC3),
        500: Color(0xff939AB4),
        600: Color(0xff7D85A5),
        700: Color(0xff687196),
        800: Color(0xff525D87),
        900: Color(0xff3D4978)
      },
    ),

    primaryColor: const Color(0xFF273469),
    scaffoldBackgroundColor: const Color(0xffF2F2F2), // +

    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(const Color(0xFF273469)),
      splashRadius: 28,
      side: const BorderSide(color: Color(0xFF273469)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        side: const BorderSide(color: Color(0xFF273469)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
      headline2: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      headline3: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      subtitle2: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF273469)),
      bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
  );
}