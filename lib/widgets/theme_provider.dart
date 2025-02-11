import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  void toggleTheme() {
    _themeData = _themeData.brightness == Brightness.dark
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}
