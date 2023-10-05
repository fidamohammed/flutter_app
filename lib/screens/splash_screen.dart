

import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/constants.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/theme/my_adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../di/locator.dart';
import '../navigation/navigation_service.dart';

final auth = FirebaseAuth.instance;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onInitializationComplete, this.savedThemeMode});

  final VoidCallback onInitializationComplete;
  final AdaptiveThemeMode? savedThemeMode;

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool hasError = false;

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return MyAdaptiveTheme(
        savedThemeMode: widget.savedThemeMode,
        themeBuilder: (lightTheme, darkTheme) =>MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Text("Hold on.."),
            ),
          ),
        )
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Center(
    //       child: Text("Hold on.."),
    //     ),
    //   ),
    // );
  }

  Future<void> initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    widget.onInitializationComplete();
  }
}


// class SplashScreen extends StatelessWidget{
//    const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Firebase initialising..'),
//     );
//   }
// }