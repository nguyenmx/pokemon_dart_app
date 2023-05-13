import 'dart:async';

import 'package:birdbook/button.dart';
import 'package:flutter/material.dart';
import 'package:birdbook/maps/pallettown.dart';

import 'characters/boy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pallet town

  double mapY = 0.0;
  double mapX = 0.0;
  //String currentLocation = "pallettown";
  int boySpriteCount = 0;
  String boyDirection = "Down";

  void moveUp() {
    boyDirection = 'Up';
    setState(() {
      mapY += 0.2;
    });
    animateWalk();
  }

  void moveDown() {
    boyDirection = 'Down';
    setState(() {
      mapY -= 0.2;
    });
    animateWalk();
  }

  void moveLeft() {
    boyDirection = 'Left';
    setState(() {
      mapX += 0.2;
    });
    animateWalk();
  }

  void moveRight() {
    boyDirection = 'Right';
    setState(() {
      mapX -= 0.2;
    });
    animateWalk();
  }

  void pressedA() {}
  void pressedB() {}

  void animateWalk() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });

      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    PalletTown(x: mapX, y: mapY, currentMap: 'pallettown'),
                    Container(
                      alignment: Alignment(0, 0),
                      child: myBoy(
                        boySpriteCount: boySpriteCount,
                        direction: boyDirection,
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
                color: Colors.grey[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'G A M E B O Y ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(height: 50, width: 50),
                                  MyButton(
                                    text: '←',
                                    function: moveLeft,
                                  ),
                                  Container(height: 50, width: 50),
                                ],
                              ),
                              Column(
                                children: [
                                  MyButton(
                                    text: '↑',
                                    function: moveUp,
                                  ),
                                  Container(height: 50, width: 50),
                                  MyButton(
                                    text: '↓',
                                    function: moveDown,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(height: 50, width: 50),
                                  MyButton(
                                    text: '→',
                                    function: moveRight,
                                  ),
                                  Container(height: 50, width: 50),
                                ],
                              )
                            ],
                          ),
                          MyButton(
                            text: 'a',
                            function: pressedA,
                          ),
                          MyButton(
                            text: 'b',
                            function: pressedB,
                          ),
                        ]),
                    Text(
                      ' P A L L E T  T O W N',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
