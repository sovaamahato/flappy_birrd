import 'dart:async';

import 'package:flappy_bird/my_bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdYaxis =0;

  //equation 
  //y=-g/2*time^2+velocity*time
  //i.e height=-4.9*time+ 3*time   here g=-9.8, velocity=3
  double height=0;
  double time=0;
  double initialHeight =0;
  


  void Jump(){
    initialHeight=birdYaxis;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      
       time+=0.4;
      height = -4.9*time*time+2.8*time;
      setState(() {
       
      birdYaxis=initialHeight-height;
     
    });
    
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
            child: GestureDetector(
              onTap: Jump,
              child: AnimatedContainer(
                alignment: Alignment(0,birdYaxis),
                duration: Duration(milliseconds: 0),
                      color: Colors.blueAccent,
                      child: MyBird(),
                    ),
            )),
        Expanded(
            child: Container(
          color: Colors.green,
        ))
      ]),
    );
  }
}
