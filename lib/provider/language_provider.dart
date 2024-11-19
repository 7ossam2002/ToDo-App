import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLang = 'en';

  String get currentLang => _currentLang;

  // Initialize language by loading from SharedPreferences
  Future<void> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentLang = prefs.getString('language') ?? 'en'; // Default to English
    notifyListeners();
  }

  // Change language and save to SharedPreferences
  void changeAppLang(String newLang) {
    if (_currentLang == newLang) return;
    _currentLang = newLang;
    _saveLang(newLang);
    notifyListeners();
  }

  // Helper to determine current language
  bool isSelectedEnglish() => _currentLang == 'en';

  // Save language to SharedPreferences
  Future<void> _saveLang(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }
}
