import 'package:flutter/material.dart';
import 'package:memory_game/play_again.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'data/level2_data.dart';
import 'models/TileModel.dart';

class Level2 extends StatefulWidget {
  Level2({Key key}) : super(key: key);

  @override
  _Level2State createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    points = 0;
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("2 seconds done");
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                points != 1200
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$points/1200",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Points",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Countdown(
                            seconds: 60,
                            build: (BuildContext context, double time) => Text(
                              "00:$time",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            interval: Duration(milliseconds: 1000),
                            onFinished: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayAgain(
                                        points: points,
                                        level: "level2",
                                        max_points: 1200)),
                              );
                            },
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                  children: List.generate(gridViewTiles.length, (index) {
                    return Tile(
                      imagePathUrl: gridViewTiles[index].getImageAssetPath(),
                      tileIndex: index,
                      parent: this,
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _Level2State parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same + points will in
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              if (points == 1200) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayAgain(
                          points: points, level: "leve2", max_points: 1200)),
                );
              }
              print(selectedTile + " thishis" + widget.imagePathUrl);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      //when pairs match, a tick image will be displayed
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Container(
                color: Colors.white,
                child: Image.asset("assets/tick1.png"),
              ),
      ),
    );
  }
}
