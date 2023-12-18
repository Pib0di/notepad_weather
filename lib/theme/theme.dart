import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF63D0FF),
);

ThemeData themeData = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF63D0FF)),
  colorScheme: colorScheme,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(8),
    border: InputBorder.none,
  ),
  // scaffoldBackgroundColor: const Color(0xFF282E45),
  // scaffoldBackgroundColor: const Color(0xFF282E45),
  appBarTheme: AppBarTheme(
      // color: Colors.cyanAccent,
      ),
  // textTheme: const TextTheme(
  //   displayMedium: TextStyle(
  //     color: Colors.white,
  //   ),
  //   displayLarge: TextStyle(
  //     color: Colors.white,
  //   ),
  //   displaySmall: TextStyle(
  //     color: Colors.white,
  //   ),
  // ),
);
