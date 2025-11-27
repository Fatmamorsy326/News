import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs=await SharedPreferences.getInstance();
  }
  static void setMode(ThemeMode mode){
    String savedTheme= mode==ThemeMode.light?"light":"dark";
    prefs.setString("theme", savedTheme);
  }
  static ThemeMode? getMode(){
    String? savedTheme=prefs.getString("theme");
    if(savedTheme=="light"){
      return ThemeMode.light;
    }else if(savedTheme=="dark"){
      return ThemeMode.dark;
    }
    return null;
  }
}