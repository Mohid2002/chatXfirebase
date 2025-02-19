import 'package:firebasexchatapp/pages/login_page.dart';
import 'package:firebasexchatapp/pages/registration_page.dart';
import 'package:flutter/material.dart';


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void togglePage(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPagee(
        ontap: togglePage,
      );
    }
    else{
      return RegisterPage(
        ontap: togglePage,
      );
    }
  }
}
