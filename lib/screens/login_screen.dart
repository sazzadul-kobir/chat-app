import 'package:flutter/material.dart';

import '../widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20
          ),
          child: Column(
            children: [
              _headerText(),

              TextfieldContainer(context),

              loginButton(context),
              
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("don't have an account?"),
                  Text(
                    "sign up",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
                ],
              )),


            ],
          ),
        ),
      ),
    );
  }

  SizedBox loginButton(BuildContext context) {
    return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: () {  },
                color: Theme.of(context).colorScheme.primary,
                child: Text(
                  "login",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),

              ),
            );
  }

  Container TextfieldContainer(BuildContext context) {
    return Container(


              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height*0.05
              ),
              child: Form(
                child:Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomFormField(
                      hint: "email",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    CustomFormField(
                      hint: "password",
                    ),
                  ],
                ),
              ),
            );
  }
  Widget _headerText(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, Welcome Back!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),
          ),
          Text(
            "Hello again, you've been missed",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.grey
            ),
          ),

        ],
      ),
    );
  }
}
