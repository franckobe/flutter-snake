import 'package:flutter/material.dart';
import 'package:snake/tools/Direction.dart';

class DirectionControls extends StatelessWidget {
  const DirectionControls({Key? key, required this.changeDirection}) : super(key: key);

  final Function changeDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black87,
            child: IconButton(
              iconSize: 30,
              alignment: Alignment.center,
              color: Colors.white,
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                changeDirection(Direction.UP);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.black87,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: IconButton(
                    iconSize: 30,
                    alignment: Alignment.center,
                    color: Colors.white,
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      changeDirection(Direction.LEFT);
                    },
                  ),
                ),
              ),
              Container(width: 46, height: 48, color: Colors.black87),
              Container(
                color: Colors.black87,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: IconButton(
                    iconSize: 30,
                    alignment: Alignment.center,
                    color: Colors.white,
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      changeDirection(Direction.RIGHT);
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black87,
            child: IconButton(
              iconSize: 30,
              alignment: Alignment.center,
              color: Colors.white,
              icon: Icon(Icons.arrow_downward),
              onPressed: () {
                changeDirection(Direction.DOWN);
              },
            ),
          ),
        ],
      ),
    );
  }
}
