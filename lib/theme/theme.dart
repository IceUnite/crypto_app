
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);