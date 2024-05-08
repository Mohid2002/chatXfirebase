import 'package:firebasexchatapp/Services/Authentication/auth_service.dart';
import 'package:flutter/material.dart';

import '../componenets/all_buttons.dart';
import '../componenets/all_text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _crfmpasswordController = TextEditingController();
  final void Function()? ontap;

  RegisterPage({Key? key, this.ontap}) : super(key: key);

  void Register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _crfmpasswordController.text)
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set scaffold background to transparent
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple, // Deep Purple color
              Colors.cyan, // Cyan color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 50),
                Text(
                  "Let's create a new account",
                  style: TextStyle(
                    color: Colors.white, // Text color changed to white
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: false,
                    controller: _emailController,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black, // Icon color changed to white
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5), // Transparent white color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black, // Icon color changed to white
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5), // Transparent white color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    controller: _crfmpasswordController,
                  ),
                ),
                SizedBox(height: 25),
                MyButton(
                  text: 'Register',
                  onTap: () => Register(context),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: ontap,
                      child: Text(
                        "Log in now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
