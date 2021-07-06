import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({Key? key, required this.score, required this.maxScore}) : super(key: key);

  final int score;
  final int maxScore;

  @override
  _ScoreboardState createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                color: Colors.amberAccent,
                child: Text('Score : '),
              ),
              Container(
                color: Colors.amberAccent,
                child: Text(widget.score.toString(), textAlign: TextAlign.center,),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.blue,
                child: Text('Meilleur score : '),
              ),
              Container(
                color: Colors.blue,
                child: Text(widget.maxScore.toString(), textAlign: TextAlign.center,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
