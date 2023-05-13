import 'package:da_hood/autenticate/loginpage.dart';
import 'package:da_hood/autenticate/registerpage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    showLoginPage = !showLoginPage;
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
