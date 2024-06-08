import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:untitled6/screens/home_screen.dart';
import 'package:untitled6/screens/login_screen.dart';

class navigationService{
  late GlobalKey<NavigatorState> _navigatorKey=GlobalKey();

  final Map<String,Widget Function(BuildContext)> _routes={
    "/login":(context)=>LoginScreen(),
    "/home":(context)=>HomeScreen()
  };

  GlobalKey<NavigatorState>? get navigatorkey{
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)> get routes{
    return _routes;
  }

  NavigationService(){
    _navigatorKey=GlobalKey<NavigatorState>();
  }

  void Pushnamed(String routeName){
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void PushReplacement(String routeName){
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBacke(){
    _navigatorKey.currentState?.pop();
  }
}