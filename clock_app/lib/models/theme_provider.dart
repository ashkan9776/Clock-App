import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isLight = true;

  // ignore: non_constant_identifier_names
  void ChangeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }

  bool get isLight => _isLight;
}
