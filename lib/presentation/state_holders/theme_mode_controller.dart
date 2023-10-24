import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeController{
  ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
  void changeThemeMode(ThemeMode mode){
    themeMode.value = mode;
    _saveThemeModeToPreferences(mode);
  }
  void toggleThemeMode(){
    if(themeMode.value == ThemeMode.light){
      themeMode.value = ThemeMode.dark;
    }else{
      themeMode.value = ThemeMode.light;
    }
    _saveThemeModeToPreferences(themeMode.value);
  }

  Future<void> _saveThemeModeToPreferences(ThemeMode mode) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('themeMode', mode.toString().split('.').last);
  }

  Future<void> initializeThemeMode() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final storedThemeMode = sharedPreferences.getString('themeMode');
    if (storedThemeMode != null) {
      final theme = ThemeMode.values.firstWhere(
              (e) => e.toString().split('.').last == storedThemeMode);
      themeMode.value = theme;
    }
  }
}