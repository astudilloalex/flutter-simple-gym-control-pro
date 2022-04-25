import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData get light {
    return ThemeData.light().copyWith(
      // Check box theme
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      // Elevated button theme.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          minimumSize: const Size(48.0, 48.0),
        ),
      ),
      // Input theme (TextFormField, TextField).
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
