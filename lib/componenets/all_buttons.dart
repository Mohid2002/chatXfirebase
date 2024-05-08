import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(
          //color: Theme.of(context).colorScheme.secondary,
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(60),
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
