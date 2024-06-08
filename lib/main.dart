import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/screens/login_screen.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/services/auth_services.dart';
import 'package:untitled6/services/navigation_service.dart';



import 'package:untitled6/utils/utils.dart';

import 'firebase_options.dart';

void main() async{

  await Setup();



  runApp(MyApp());
}

Future<void> Setup() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SetupFirebase();
  await registerServices();


}


class MyApp extends StatelessWidget {
  final GetIt _getIt=GetIt.instance;
  late final navigationService _navigationservice;

    MyApp({super.key}){
  _navigationservice=_getIt.get<navigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationservice.navigatorkey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: _navigationservice.routes,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

