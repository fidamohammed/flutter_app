
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/di/locator.dart';
import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/route_generator.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/categories.dart';
import 'package:first_app/screens/category_details.dart';
import 'package:first_app/screens/home/screen_breakpoints.dart';
import 'package:flutter/material.dart';

import '../../navigation/navigation_service.dart';

class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});

  List<String> _drawerItems = [];


  @override
  Widget build(BuildContext context) {
    _drawerItems = [
      "Profile",
      "Home",
      "Settings",
      "${AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? "Dark" : "Light"} Theme",
      "Sign out",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen',),
        actions: <Widget>[
          IconButton(
            onPressed: ()  async {
              await FirebaseAuth.instance.signOut();
              navService.replaceToByClearingStack(Routes.login);
            },
            icon: Icon(Icons.logout), )
        ],
      ),
      drawer: Drawer(
        child: DrawerList(
          items: _drawerItems,
          onItemTap: (position ) {
            onDrawerItemTap(context, position);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () { navService.navigateTo(Routes.createCategory); },
        child: Icon(Icons.add),
      ),
      body:
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > ScreenBreakPoints.tablet) {
              return const WideWidget();
            } else {
              return const NarrowWidget();
            }
          }),
    );
  }


   void onDrawerItemTap(BuildContext context, int itemIndex){
     // navService.goBack();
     switch(_drawerItems[itemIndex]){
       case 'Profile':
         navService.navigateTo(Routes.profile);
       case 'Settings':
         navService.navigateTo(Routes.settings);
       case "Light Theme":
         AdaptiveTheme.of(context).setLight();
       case "Dark Theme":
         AdaptiveTheme.of(context).setDark();
     }
   }

}

class WideWidget extends StatefulWidget {
  const WideWidget({super.key});


  @override
  State<WideWidget> createState() => _WideWidget();
}

class _WideWidget extends State<WideWidget> {

  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 240,
          child: CategoryScreen(),
        ),
        Expanded(
            child:CategoryDetails(showAppBar: false,)
        )
      ],
    );
  }

  _selectItem(Category category) {
    if(_selectedCategory!= category){
      setState(() {
        _selectedCategory = category;
      });
    }
  }
}

class NarrowWidget extends StatelessWidget {
  const NarrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryScreen();
  }
}