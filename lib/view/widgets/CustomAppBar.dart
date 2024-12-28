import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12, // Set the background color here
      ),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(

        children: [
         TextSpan(
           text: "WALL",
           style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w600),

         ),
          TextSpan(
              text: "P",
           style: TextStyle(fontSize: 25, color: Colors.pinkAccent,fontWeight: FontWeight.w600)
          ),
          TextSpan(
              text: "E",
              style: TextStyle(fontSize: 25,color: Colors.pinkAccent,fontWeight: FontWeight.w600)
          ),
        ]
      )),
    );
  }
}
