// Gestion du theme
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: Colors.deepOrange,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: Colors.deepOrange,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
