
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:first_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class MyAdaptiveTheme extends StatelessWidget{
  const MyAdaptiveTheme({super.key, this.savedThemeMode, required this.themeBuilder});

  final AdaptiveThemeMode? savedThemeMode;
  final AdaptiveThemeBuilder themeBuilder;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: MyAppTheme.lightTheme,
      dark: MyAppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: themeBuilder,
    );
  }

}