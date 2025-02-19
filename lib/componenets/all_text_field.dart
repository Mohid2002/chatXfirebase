import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  //final FocusNode? focusNode;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    //required this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        //focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //color: Theme.of(context).colorScheme.tertiary,
              color: Colors.black
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //color: Colors.blue,
            ),
          ),
          fillColor: Colors.blue,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
