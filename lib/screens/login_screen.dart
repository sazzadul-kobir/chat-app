import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/const/const.dart';
import 'package:untitled6/services/auth_services.dart';

import '../widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GetIt _getIt =GetIt.instance;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? email, password;

  late AuthService _authSerivice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authSerivice=_getIt.get<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                _headerText(),
                _textfieldContainer(context),
                _loginButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Add navigation to sign up screen
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _loginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: () async{
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState!.save();
            bool result=await _authSerivice.login(email!, password!);
            print(result);
            if(result){

            }
          }
        },
        color: Theme.of(context).colorScheme.primary,
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container _textfieldContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomFormField(
              onSaved: (value) {
                setState(() {
                  email = value;
                });
              },
              validationRegExp: EMAIL_VALIDATION_REGEX,
              hint: "Email",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomFormField(
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
               obescureText: true,
              validationRegExp: PASSWORD_VALIDATION_REGEX,
              hint: "Password",
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hi, Welcome Back!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(
            "Hello again, you've been missed",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
