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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ValleyColors.orange1, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.black87
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 15),
        itemCount: 300,
        itemBuilder: (context, index) {
          Color cellColor = Colors.transparent;
          bool isHead = false;
          bool isSnake = false;
          if ( widget.snakePoints.contains(index) ) {
            isSnake = true;
            if ( index == widget.snakePoints.last ) {
              // cellColor = Colors.amber;
              isHead = true;
            }
            else cellColor = ValleyColors.yellow2;
          }
          //else if ( index == widget.foodPosition ) cellColor = Colors.green;

          return Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              image: index == widget.foodPosition ? DecorationImage(image: AssetImage('assets/donut.png')) : null,
              color: cellColor,
              border: Border.all(
                color: isSnake && !isHead ? ValleyColors.yellow2 : Colors.transparent,
                width: 1
              )
            ),
            child: isHead ? RotatedBox(
              quarterTurns: getQuarterForDirection(),
              child: OverflowBox(
                alignment: Alignment(-0.7, 0.7),
                maxHeight: 35,
                maxWidth: 50,
                child: Image(
                  image: AssetImage('assets/homer.png'),
                ),
              ),
            ) : null,
          );
        },
      ),
    );
  }
}
