import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple.withOpacity(0.5),
      scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple.withOpacity(0.5),
      scaffoldBackgroundColor: Colors.grey[700],
      appBarTheme: AppBarTheme(
        color: Colors.grey[800],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 2.0),
        ),
      ),
    );
  }
}
