import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdYaxis;
  final double birdWidth;
  final double birdHeight;

  const MyBird({this.birdYaxis,required this.birdHeight,required this.birdWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Image.asset("lib/images/bird.png",
    width: MediaQuery.of(context).size.height*birdWidth/1,
    height: MediaQuery.of(context).size.height*3/3.5*birdHeight/1,
    fit: BoxFit.fill,),
    );
  }
}