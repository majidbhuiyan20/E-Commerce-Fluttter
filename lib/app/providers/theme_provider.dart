import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKey = 'themeMode';
  ThemeMode _currentThemeMode = ThemeMode.light; // default

  ThemeMode get currentThemeMode => _currentThemeMode;

  Future<void> loadInitialThemeMode() async {
    ThemeMode mode = await _getThemeMode();
    _currentThemeMode = mode;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    if (_currentThemeMode == mode) return;

    _currentThemeMode = mode;
    _saveThemeMode(mode.name);
    notifyListeners();
  }

  Future<void> _saveThemeMode(String mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode);
  }

  Future<ThemeMode> _getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedThemeMode = prefs.getString(_themeKey) ?? 'light';
    return getThemeModeFromString(savedThemeMode);
  }

  ThemeMode getThemeModeFromString(String v) {
    switch (v) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}
