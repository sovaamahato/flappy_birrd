import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Image.asset("lib/images/bird.png",width: 60,),);
  }
}