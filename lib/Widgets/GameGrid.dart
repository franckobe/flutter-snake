import 'package:flutter/material.dart';
import 'package:snake/tools/Direction.dart';
import 'package:snake/tools/ValleyColors.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({Key? key, required this.foodPosition, required this.snakePoints, required this.direction}) : super(key: key);

  final int foodPosition;
  final Direction direction;
  final List<int> snakePoints;

  @override
  _GameGridState createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {

  int getQuarterForDirection() {
    int nb = 2;
    if ( widget.direction == Direction.RIGHT ) nb = 1;
    if ( widget.direction == Direction.LEFT ) nb = 3;
    if ( widget.direction == Direction.UP ) nb = 0;
    return nb;
  }

  Direction getNextDirection(index, currentIndex) {
    Direction nextDirection = widget.direction;
    if ( widget.snakePoints[currentIndex+1] == index + 15 || widget.snakePoints[currentIndex+1] == index - 285 ) {
      nextDirection = Direction.DOWN;
    }
    else if ( widget.snakePoints[currentIndex+1] == index - 15 || widget.snakePoints[currentIndex+1] == index + 285 ) {
      nextDirection = Direction.UP;
    }
    else if ( widget.snakePoints[currentIndex+1] == index + 1 || widget.snakePoints[currentIndex+1] == index - 14 ) {
      nextDirection = Direction.RIGHT;
    }
    else if ( widget.snakePoints[currentIndex+1] == index - 1 || widget.snakePoints[currentIndex+1] == index + 14 ) {
      nextDirection = Direction.LEFT;
    }
    return nextDirection;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ValleyColors.orange1, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 0)
          )
        ]
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 15),
        itemCount: 300,
        itemBuilder: (context, index) {

          bool isHead = false;
          bool isTail = false;
          bool isSnake = false;

          Color cellColor = Colors.transparent;
          BoxDecoration cellDecoration = BoxDecoration(
            border: Border.all(
              color: cellColor,
            )
          );

          if ( widget.snakePoints.contains(index) ) {
            isSnake = true;
            cellColor = Color(0xFFF5DC10);
            if ( index == widget.snakePoints.last ) {
              isHead = true;
              cellDecoration = BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.transparent,
                  )
              );
            }
            else if ( index == widget.snakePoints.first ) {
              isTail = true;
              // Détection de la direction du prochain point
              int currentIndex = widget.snakePoints.indexOf(index);
              Direction nextDirection = isHead ? widget.direction : getNextDirection(index, currentIndex);

              cellDecoration = BoxDecoration(
                  color: cellColor,
                  border: Border.all(
                    color: cellColor,
                  ),
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular([Direction.DOWN, Direction.RIGHT].indexOf(nextDirection) != -1 ? 7 : 0),
                  topRight: Radius.circular([Direction.DOWN, Direction.LEFT].indexOf(nextDirection) != -1 ? 7 : 0),
                  bottomLeft: Radius.circular([Direction.UP, Direction.RIGHT].indexOf(nextDirection) != -1 ? 7 : 0),
                  bottomRight: Radius.circular([Direction.UP, Direction.LEFT].indexOf(nextDirection) != -1 ? 7 : 0),
                )
              );
            }
            else {
              cellDecoration = BoxDecoration(
                color: cellColor,
                border: Border.all(
                  color: cellColor,
                  width: 0.1
                ),
              );
            }

          }
          else if ( index == widget.foodPosition ) {
            cellDecoration = BoxDecoration(
                color: cellColor,
                border: Border.all(
                  color: cellColor,
                ),
                image: widget.foodPosition == index ? DecorationImage(
                    image: AssetImage('assets/donut.png')
                ) : null
            );
          }

          return Container(
            decoration: cellDecoration,
            child: isHead ? RotatedBox(
              quarterTurns: getQuarterForDirection(),
              child: OverflowBox(
                alignment: Alignment(0.5, 0.7),
                maxHeight: 35,
                maxWidth: 50,
                child: Image(
                  image: AssetImage('assets/hand.png'),
                ),
              ),
            ) : null,
          );
        },
      ),
    );
  }
}
