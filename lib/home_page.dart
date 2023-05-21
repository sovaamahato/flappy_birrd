import 'dart:async';

import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/my_bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  static double barrierXone=0;
  double barrierXtwo=1;
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
      height = -4.0 * time * time + 3 * time;
      setState(() {
        birdYaxis = initialHeight - height;
        print("yaxis value=");
        print(birdYaxis);
      });


      //check bird dead
      if(birdDead())
      {
        timer.cancel();
        gameHasStarted=false;
        _showDialogBox();
      }
//this piece of code make to move the poles 
//and also keeps on adding the poles as the screen moves
      setState(() {
        if(barrierXone<-1.1){
          barrierXone+=2.2;
        }else{
          barrierXone -=0.1;
      
        }
      });

      setState(() {
        if(barrierXtwo<-1.1){
          barrierXtwo+=2.2;
        }else{
          barrierXtwo -=0.1;
      
        }
      });

      

      // if (birdYaxis > 0.9) {
      //   timer.cancel();
      //   print("timer cancel");
      //   gameHasStarted = false;
      // }
    });
  }

  bool birdDead(){
    //check if the bird is hitting the top or the bottom of the screen
    if(birdYaxis<-1|| birdYaxis>1){
      return true;
    }
    else {
      return false;
    }
  }

  //reset the game
  void resetGame(){
    Navigator.pop(context);//dismiss the alert dialog
    setState(() {
      birdYaxis =0;
      gameHasStarted=false;
      time=0;
      initialHeight=birdYaxis;
    });
  }


  //dialog box after game over
  void _showDialogBox()
  {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text(" Game Over",style: TextStyle(color: Colors.white),),

          ),
          actions: [
            GestureDetector(
              onTap: resetGame,
              child: ClipRRect(borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Text("Play Again",style: TextStyle(color: Colors.brown),),
            )),),
          ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                if (gameHasStarted == true) {
                  Jump();
                } else {
                  startGame();
                }
              },
      child: Scaffold(
        body: Column(children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(-0.9, birdYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blueAccent,
                    child: MyBird(),
                  ),
    
                  //tap to play -TEXT--------
                  Container(
                    alignment: Alignment(-0.9, -0.23),
                    child:gameHasStarted?Text(" "): Text(
                      "T A P  TO  P L A Y",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
    
                  //polesss--------------------------------------------------------
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, -1.1),
                    child: Barrier(size: 100.0),
                  ),
    
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, 1.1),
                    child: Barrier(size: 170.0),
                  ),
    
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, -1.1),
                    child: Barrier(size: 150.0),
                  ),
    
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, 1.1),
                    child: Barrier(size: 110.0),
                  ),
                ],
              )),
          Container(
            height: 15,
            color: Colors.green,
          ),
          //scoring part--------------------------------------------------------
          Expanded(
              child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //score column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Score",
                      style: const TextStyle(fontSize: 25,color: Colors.white),
                      
                    ),
                    Text(
                      "0",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                //highest score column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Best\nScore",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        )),
                    Text("0",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )),
                  ],
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
