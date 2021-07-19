import 'package:flutter/material.dart';
import 'package:snake/tools/ValleyColors.dart';

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
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ValleyColors.yellow2, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Score',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.score.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ValleyColors.yellow2, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        'Meilleur',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.maxScore.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 42,
            child: OverflowBox(
                alignment: Alignment(0.05, -0.5),
                maxHeight: 150,
                maxWidth: 230,
                child: Image(
                  image: AssetImage('assets/banner.png'),
                )
            ),
          )
        ],
      ),
    );
  }
}
