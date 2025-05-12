import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 221, 221, 221),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.black87,
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black87,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(color: Colors.grey[700], fontSize: 12),
  ),
  dividerColor: Colors.black54,
  listTileTheme: const ListTileThemeData(iconColor: Colors.black87),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: Colors.black87),
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
  scaffoldBackgroundColor: const Color.fromARGB(255, 23, 23, 23),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(color: Colors.grey, fontSize: 12),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
  ),
  colorScheme: const ColorScheme.dark(primary: Color.fromARGB(255, 73, 73, 73)),
  dividerColor: Colors.black54,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 23, 23, 23),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
