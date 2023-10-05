import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme{

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 71, 233, 133),
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      // appBarTheme: const AppBarTheme().copyWith(
      //   backgroundColor: kColorScheme.onPrimaryContainer,
      //   foregroundColor: kColorScheme.primaryContainer,
      // ),
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
  // ThemeData(
  //   useMaterial3: true,
  //   brightness: Brightness.light,
  //   scaffoldBackgroundColor: Color.fromARGB(255, 235, 246, 236),
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Color.fromARGB(255, 132, 157, 134),
  //
  //   ),
  //   textTheme: GoogleFonts.latoTextTheme(),
  //   floatingActionButtonTheme: FloatingActionButtonThemeData()
  // );

  static ThemeData get darkTheme{
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 71, 233, 133),
        brightness: Brightness.dark,
      ),
      // appBarTheme: const AppBarTheme().copyWith(
      //   backgroundColor: kColorScheme.onPrimaryContainer,
      //   foregroundColor: kColorScheme.primaryContainer,
      // ),
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
  // ThemeData(
  //   useMaterial3: true,
  //     brightness: Brightness.dark,
  //
  //     scaffoldBackgroundColor: Color.fromARGB(255, 32, 54, 33),
  //     appBarTheme: AppBarTheme(
  //     backgroundColor: Color.fromARGB(255, 32, 54, 33),
  //     ),
  //   textTheme: GoogleFonts.latoTextTheme(),
  // );

}

// var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 71, 233, 133));
// var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 54, 33));
//
// final theme = ThemeData(
//   useMaterial3: true,
//   brightness: Brightness.light,
//   colorScheme: kColorScheme,
//   drawerTheme: DrawerThemeData(
//
//   ),
//   appBarTheme: const AppBarTheme().copyWith(
//     backgroundColor: kColorScheme.onPrimaryContainer,
//     foregroundColor: kColorScheme.primaryContainer,
//   ),
//   textTheme: GoogleFonts.latoTextTheme(),
// );
//
//
// final darkTheme = ThemeData(
//   useMaterial3: true,
//   colorScheme: kDarkColorScheme.copyWith(brightness: Brightness.dark,background: Colors.black38),
//   appBarTheme: const AppBarTheme().copyWith(
//     backgroundColor: kColorScheme.onPrimaryContainer,
//     foregroundColor: kColorScheme.primaryContainer,
//   ),
//   textTheme: GoogleFonts.latoTextTheme(),
// );