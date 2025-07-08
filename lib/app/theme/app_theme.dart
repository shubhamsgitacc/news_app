import 'package:flutter/material.dart';

abstract class AppTheme {
  Color backgroundColor();
  Color primaryColor();
  Color secondaryColor();
  Color textColor();
  ThemeData theme() => ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor(),
      scaffoldBackgroundColor: backgroundColor(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor(),
        brightness: Brightness.light, // or dark
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: textColor()),
        bodyMedium: TextStyle(color: textColor()),
        bodySmall: TextStyle(color: textColor()),
        titleLarge: TextStyle(color: textColor()),
        labelLarge: TextStyle(color: textColor()),
      ));
}

