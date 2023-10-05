
import 'dart:ffi';

import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/category_details.dart';
import 'package:first_app/screens/create_category.dart';
import 'package:first_app/screens/edit_category.dart';
import 'package:first_app/screens/forgot_password.dart';
import 'package:first_app/screens/categories.dart';
import 'package:first_app/screens/home/home.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/profile_screen.dart';
import 'package:first_app/screens/settings_screen.dart';
import 'package:first_app/screens/signup.dart';
import 'package:first_app/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(Routes.values.byName(settings.name ?? '')){
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.category:
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      case Routes.categoryDetails:
        return MaterialPageRoute(builder: (context) => CategoryDetails());
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case Routes.createCategory:
        return MaterialPageRoute(builder: (context) => CreateCategory());
      case Routes.updateCategory:
        return MaterialPageRoute(builder: (context) => EditCategory(category: settings.arguments as Category,));


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Not found ${settings.name}"),
            ),
          ),
        );
    }

  }
}