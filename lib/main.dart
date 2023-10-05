import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/splash_screen.dart';
import 'package:first_app/theme/my_adaptive_theme.dart';
import 'package:first_app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:first_app/di/locator.dart';
import 'package:first_app/navigation/navigation_service.dart';
import 'package:first_app/navigation/route_generator.dart';
import 'package:flutter/material.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(SplashScreen(
      savedThemeMode: savedThemeMode,
      onInitializationComplete: () {
        runMainApp();
      }));
}

void runMainApp() async {
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(child: _App(savedThemeMode: savedThemeMode)));
}

class _App extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const _App({required this.savedThemeMode});

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MyAdaptiveTheme(
      savedThemeMode: widget.savedThemeMode,
      themeBuilder: (lightTheme, darkTheme) => MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute:
            auth.currentUser == null ? Routes.login.name : Routes.home.name,
        // home: loggedIn ? HomeScreen(email: FirebaseAuth.instance.currentUser?.email,) : LoginScreen(),
      ),
    );
  }
}
