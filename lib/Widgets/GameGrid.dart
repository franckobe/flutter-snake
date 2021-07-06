import 'package:flutter/material.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({Key? key, required this.foodPosition, required this.snakePoints}) : super(key: key);

  final int foodPosition;
  final List<int> snakePoints;

  @override
  _GameGridState createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 15),
      itemCount: 300,
      itemBuilder: (context, index) {
        Color cellColor = Colors.white;
        if ( widget.snakePoints.contains(index) ) {
          if ( index == widget.snakePoints.last ) cellColor = Colors.amber;
          else cellColor = Colors.deepPurpleAccent;
        }
        else if ( index == widget.foodPosition ) cellColor = Colors.green;

        return Padding(
          padding: EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
                color: cellColor,
                border: Border.all(color: Colors.transparent)
            ),
            child: Center(
            //child: Text('$index', style: TextStyle(fontSize: 8),),
            ),
          ),
        );
      },
    );
  }
}
