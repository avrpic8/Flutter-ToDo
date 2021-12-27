import 'package:flutter/cupertino.dart';

class Settings{

  bool isDark = false;
  Locale? locale = Locale('en');

  Settings({required this.isDark, this.locale});

  bool getThemeType(){
    return this.isDark;
  }
}