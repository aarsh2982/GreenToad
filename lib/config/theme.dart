// App Theme Configurations
import 'package:flutter/material.dart';

// App Theme Class
class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    // Apply the custom font to the entire app
    fontFamily: "Montserrat",
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14.0,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    // Apply the custom font to the entire app
    fontFamily: "Montserrat",
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14.0,
      ),
    ),
  );
}
