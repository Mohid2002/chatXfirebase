import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {

  final String text;
  final void Function()? onTap;

  const UserTitle({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),

        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 20,),

            Text(text),
          ],
        ),
      ),
    );
  }
}
