import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  //final size;
  final  barrierHeight;
  final  barrierWidth;
  //final barrierX;
  Barrier({required this.barrierHeight,
   required this.barrierWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*3/4*barrierHeight/2,
      width: MediaQuery.of(context).size.width*barrierWidth/2,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 49, 107, 51), width: 5),
          
        color: Colors.green,
      ),
    );
  }
}
