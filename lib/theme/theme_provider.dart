import 'package:crypto_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme(ThemeData theme) {
    if (_themeData == darkMode) {
      themeData = lightMode;
    } else if (_themeData == lightMode) {
      themeData = darkMode;
    }
  }
}
