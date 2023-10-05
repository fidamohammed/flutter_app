
import 'package:first_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';

class NavigationService{
  final navigatorKey = GlobalKey<NavigatorState>();

  dynamic navigateTo(Routes route, {Object? arguments}){
    return navigatorKey.currentState?.pushNamed(route.name,arguments: arguments);
  }
  dynamic replaceTo(Routes route, {Object? arguments}){
    return navigatorKey.currentState?.pushReplacementNamed(route.name, arguments: arguments);
  }
  dynamic replaceToByClearingStack(Routes route, {Object? arguments}){
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route.name, (route) => false, arguments: arguments);
  }
  dynamic replaceToByClearingStackTill(Routes route, RoutePredicate predicate, {Object? arguments}){
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route.name,predicate, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}