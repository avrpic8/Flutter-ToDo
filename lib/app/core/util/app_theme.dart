import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/colors.dart';

class MyAppTheme {
  static const String FA_PRIMARY_FONT = "Iransanse";

  final Color primaryTextColor;
  final Color secondryTextColor;
  final Color subtitleTextColor;

  MyAppTheme.dark()
      : primaryTextColor = primaryTextColorDark,
        secondryTextColor = secondryTextColorDark,
        subtitleTextColor = subTitleTextColorDark;

  MyAppTheme.light()
      : primaryTextColor = primaryTextColorLight,
        secondryTextColor = secondryTextColorLight,
        subtitleTextColor = subTitleTextColorLight;

  ThemeData getDarkTheme(String languageCode) {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          secondary: Colors.orangeAccent,
          onSecondary: Colors.white,
          background: Colors.black12,
          surface: Colors.black45),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(thumbColorDark),
          trackColor: MaterialStateProperty.resolveWith(_getColor)
          ),
      textTheme: languageCode == 'en' ? enPrimaryFont : faPrimaryFont,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade300)),
      ),
    );
  }

  ThemeData getLightTheme(String languageCode) {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.lightBlueAccent,
          onSecondary: Colors.white,
          background: Colors.white,
          surface: Colors.white),
      textTheme: languageCode == 'en' ? enPrimaryFont : faPrimaryFont,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade300)),
      ),
    );
  }

  TextTheme get enPrimaryFont => GoogleFonts.latoTextTheme(
        TextTheme(
            bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
            bodyText1: TextStyle(fontSize: 13, color: secondryTextColor),
            headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: subtitleTextColor,
            ),
            caption: TextStyle(color: secondryTextColor)),
      );

  TextTheme get faPrimaryFont => TextTheme(
        bodyText2: TextStyle(
            fontSize: 15, color: primaryTextColor, fontFamily: FA_PRIMARY_FONT),
        bodyText1: TextStyle(
            fontSize: 12,
            color: secondryTextColor,
            fontFamily: FA_PRIMARY_FONT),
        caption: TextStyle(
            fontSize: 12,
            fontFamily: FA_PRIMARY_FONT,
            color: secondryTextColor),
        headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: primaryTextColor,
            fontFamily: FA_PRIMARY_FONT),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: subtitleTextColor,
            fontFamily: FA_PRIMARY_FONT),
      );

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.disabled
    };
    if (states.any(interactiveStates.contains)) {
      return trackColorDark;
    }
    return secondryTextColor;
  }
}
