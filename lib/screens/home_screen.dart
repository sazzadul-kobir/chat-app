import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/services/auth_services.dart';
import 'package:untitled6/services/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final GetIt _getIt=GetIt.instance;

late AuthService _authService;
late navigationService _navigaitonservice;


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  _authService=_getIt.get<AuthService>();
  _navigaitonservice=_getIt.get<navigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Messages"),
        actions: [
          IconButton(
          onPressed: () async{
            bool result=await _authService.logout();
            if(result){
              _navigaitonservice.PushReplacement("/login");
            }
          },
            icon: Icon(Icons.logout),

            ),
        ],
      ),
    );
  }
}
