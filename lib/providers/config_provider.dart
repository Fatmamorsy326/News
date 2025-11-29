import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/prefs_manager/prefs_manager.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getMode()?? ThemeMode.dark;
  void changeTheme(ThemeMode newTheme){
    if(currentTheme!=newTheme){
      currentTheme=newTheme;
      PrefsManager.setMode(currentTheme);
      notifyListeners();
    }
  }
  bool get isDark => currentTheme==ThemeMode.dark;
}