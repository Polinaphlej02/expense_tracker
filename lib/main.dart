import 'package:flutter/material.dart';

import 'expenses.dart';

var kColorSheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 104, 229, 243));
var kDarkColorSheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 87, 92, 239)
  );

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorSheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorSheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSheme.onPrimaryContainer,
          foregroundColor: kColorSheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorSheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(fontWeight: FontWeight.normal, color: kColorSheme.onSecondaryContainer, fontSize: 25, )
        )
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
