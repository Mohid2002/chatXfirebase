import 'package:firebasexchatapp/Services/Authentication/auth_service.dart';
import 'package:flutter/material.dart';
import '../componenets/all_buttons.dart';

class LoginPagee extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  final void Function()? ontap;

  LoginPagee({Key? key, required this.ontap}) : super(key: key);

  void Login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Welcome Back to Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(height: 25),
                MyButton(
                  text: 'Login',
                  onTap: () => Login(context),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?  ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: ontap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
