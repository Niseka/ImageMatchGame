// import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/level2.dart';

import 'data/level1_data.dart';
import 'main.dart';

class PlayAgain extends StatefulWidget {
  final int points;
  final String level;
  final int max_points;
  PlayAgain(
      {Key key,
      @required this.points,
      @required this.level,
      @required this.max_points})
      : super(key: key);

  @override
  _PlayAgainState createState() => _PlayAgainState();
}

class _PlayAgainState extends State<PlayAgain> {
  ConfettiController _controllerCenter;

  @override
  void initState() {
    //the confetti blasts for 10 seconds if the max score is reached
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    if (points == 800 || points == 1200) {
      _controllerCenter.play();
    }
    super.initState();
  }

  @override
  //the confetti blasts
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // will popscope overrides back navigation whilegame continues
      // ignore: missing_return
      onWillPop: () async {},
      child: Scaffold(
        appBar: AppBar(leading: Container(), title: Text("Results")),
        body: Stack(children: <Widget>[
          //CENTER -- Blast
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality:
                  BlastDirectionality.explosive, //confetti blasts at max score
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
                Colors.yellow,
                Colors.black,
                Colors.grey,
                Colors.red
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${widget.points}/${widget.max_points}",
                  style: TextStyle(
                      //if won, text color will be green
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: widget.points < widget.max_points
                          ? Colors.red
                          : Colors.green),
                ),
                Text(
                  "Points",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      //if max score not reached, score text color turns red
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: widget.points < widget.max_points
                          ? Colors.red
                          : Colors.green),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top:
                            40)), //restarts levelsif max score not reached or proceed to lvl 2
                widget.points < widget.max_points
                    ? RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          if (widget.level == "level1") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home1()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Level2()),
                            );
                          }
                        },
                        child: Text(
                          "Replay",
                          style: TextStyle(color: Colors.white),
                        ))
                    : widget.level == "level1"
                        ? RaisedButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Level2()),
                              );
                            },
                            child: Text(
                              "Next Level",
                              style: TextStyle(color: Colors.white),
                            ))
                        : RaisedButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home1()),
                              );
                            },
                            child: Text(
                              "Restart Game", //restarts the game from the first
                              style: TextStyle(color: Colors.white),
                            ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
