import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;

  // Initialize theme by loading from SharedPreferences
  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme');
    if (savedTheme == 'dark') {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  // Change theme and save to SharedPreferences
  void changeAppTheme(ThemeMode newTheme) {
    if (_currentTheme == newTheme) return;
    _currentTheme = newTheme;
    _saveTheme(newTheme);
    notifyListeners();
  }

  // Helper to determine current theme
  bool isSelectedLight() => _currentTheme == ThemeMode.light;

  // Save theme to SharedPreferences
  Future<void> _saveTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode == ThemeMode.light ? 'light' : 'dark');
  }
}
