import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake/Widgets/DirectionControls.dart';
import 'package:snake/Widgets/GameGrid.dart';
import 'package:snake/Widgets/Scoreboard.dart';
import 'package:snake/tools/Direction.dart';


class SnakeGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  List<int> snakePoints = [];
  int foodPosition = -1;
  bool started = false;
  bool paused = false;
  bool stopped = false;
  Direction direction = Direction.DOWN;
  int score = 0;
  int maxScore = 0;
  late Timer _timer;
  bool directionControls = false;

  void initGame() {
    List<int> initialSnakePoints = [7, 22, 37, 52, 67];
    setState(() {
      snakePoints = initialSnakePoints;
      started = true;
      paused = false;
      stopped = false;
      score = 0;
      direction = Direction.DOWN;
      foodPosition = -1;
    });
  }

  void initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      moveSnake();
    });
  }

  void start() {
    initGame();
    addFood();
    initTimer();
  }

  void pause() {
    setState(() {
      paused = !paused;
    });
    if (paused) _timer.cancel();
    else initTimer();
  }

  void stop() {
    setState(() {
      paused = false;
      started = false;
      stopped = true;
      if( score > maxScore ) maxScore = score;
    });
    _timer.cancel();
  }

  void addFood() {
    int newFoodPosition;
    do {
      newFoodPosition = Random().nextInt(299);
    } while (snakePoints.contains(newFoodPosition));
    setState(() {
      foodPosition = newFoodPosition;
    });
  }

  void changeDirection(Direction newDirection) {
    if ( possiblesDirections[direction]!.contains(newDirection) ) direction = newDirection;
  }

  void moveSnake() {
    int newLast;
    switch (direction) {
      case Direction.UP : {
        newLast = snakePoints.last + ((snakePoints.last > 14) ? -15 : 285);
      }
      break;
      case Direction.DOWN : {
        newLast = snakePoints.last + ((snakePoints.last < 285) ? 15 : -285);
      }
      break;
      case Direction.LEFT : {
        newLast = snakePoints.last + ((snakePoints.last % 15 == 0) ? 14 : -1);
      }
      break;
      case Direction.RIGHT : {
        newLast = snakePoints.last + (((snakePoints.last + 1) % 15 == 0) ? -14 : 1);
      }
      break;
    }

    if ( snakePoints.contains(newLast) ) {
      stop();
      return;
    }

    if ( newLast == foodPosition ) {
      setState(() {
        snakePoints.insert(snakePoints.length, foodPosition);
        score += 10;
      });
      addFood();
    }
    else {
      setState(() {
        for(int i = 0; i < snakePoints.length - 1; i++) {
          snakePoints[i] = snakePoints[i+1];
        }
        snakePoints.last = newLast;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                changeDirection(Direction.RIGHT);
              } else if (details.primaryVelocity! < 0) {
                changeDirection(Direction.LEFT);
              }
            },
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                changeDirection(Direction.DOWN);
              } else if (details.primaryVelocity! < 0) {
                changeDirection(Direction.UP);
              }
            },
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Scoreboard(score: score, maxScore: maxScore),
                  Expanded(
                      child: GameGrid(snakePoints: snakePoints, foodPosition: foodPosition)
                  ),
                  if (directionControls) DirectionControls(changeDirection: changeDirection),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!started || stopped) ElevatedButton(onPressed: start, child: Text('Commencer')),
                        if (started && !stopped) ElevatedButton(onPressed: pause, child: Text(paused ? 'Reprendre' : 'Pause')),
                        Row(
                          children: [
                            Text('Boutons'),
                            Switch(value: directionControls, onChanged: (value) {
                              setState(() {
                                directionControls = value;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}