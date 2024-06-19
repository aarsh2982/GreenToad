// App Theme Configurations
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';

// App Theme Class
class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: Colors.grey[200],
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: whiteColor,
      foregroundColor: Color(0xFF353b48),
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      headlineMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      headlineSmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      titleLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      titleMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      titleSmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF09090B),
      ),
      bodyLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 20.0,
        color: Color(0xFF2f3542),
      ),
      bodyMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 18.0,
        color: Color(0xFF2f3542),
      ),
      bodySmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
        color: Color(0xFF2f3542),
      ),
      labelLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
        color: Color(0xFF2f3542),
      ),
      labelMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14.0,
        color: Color(0xFF2f3542),
      ),
      labelSmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12.0,
        color: Color(0xFF2f3542),
      ),
    ),
    dividerTheme: const DividerThemeData(color: offWhiteColor),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF2d3436),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: blackColor,
      foregroundColor: Color(0xFFFFFFFF),
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      headlineMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      headlineSmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      titleLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      titleMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      titleSmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      bodyLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 20.0,
        color: Color(0xFFf1f2f6),
      ),
      bodyMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 18.0,
        color: Color(0xFFf1f2f6),
      ),
      bodySmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
        color: Color(0xFFf1f2f6),
      ),
      labelLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16.0,
        color: Color(0xFFf1f2f6),
      ),
      labelMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14.0,
        color: Color(0xFFf1f2f6),
      ),
      labelSmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12.0,
        color: Color(0xFFf1f2f6),
      ),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFF565555)),
  );
}
