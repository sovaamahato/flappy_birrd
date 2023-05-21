import 'dart:async';

import 'package:flappy_bird/my_bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;

  //equation
  //y=-g/2*time^2+velocity*time
  //i.e height=-4.9*time+ 3*time   here g=-9.8, velocity=3
  double height = 0;
  double time = 0;
  double initialHeight = birdYaxis;

  bool gameHasStarted = false;

  void Jump() {
    setState(() {
      time = 0;
      
      print("jumping------------------------------------------");

      initialHeight = birdYaxis;
      

    });
  }

  void startGame() {
    print("started=--------------------------------------");
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.1;
      height = -4.5 * time * time + 3 * time;
      setState(() {
        birdYaxis = initialHeight - height;
        print("yaxis value=");
        print(birdYaxis);
      });
      if (birdYaxis >1) {
        timer.cancel();
        print("timer cancel");
        gameHasStarted = false;
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (gameHasStarted==true) {
                  Jump();
                } else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0, birdYaxis),
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
