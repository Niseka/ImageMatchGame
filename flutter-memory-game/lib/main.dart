import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memory_game/data/level1_data.dart';
import 'package:memory_game/models/TileModel.dart';
import 'package:memory_game/play_again.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'data/level1_data.dart';
// import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/newsoccer.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
    return Scaffold(
      body: new Stack(children: <Widget>[
        container,
        new Center(
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 65.0),
            color: Colors.yellow,
            child: Text(
              'Play',
              // style: TextStyle(
              //     fontSize: 32.0,
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //     textBaseline: TextBaseline.alphabetic),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home1()),
              ); // Navigate back to first route when tapped.
            },
          ),
        ),
      ]),
    );
  }
}

class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home1> {
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
//delayes the tiles by 5 seconds, then hide them for the game to begin
    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 4), () {
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
      //popscope prevents back navigation while game continues
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
                points != 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$points/800",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Points",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Countdown(
                            // timer for each level
                            seconds: 50,
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
                                          level: "level1",
                                          max_points: 800,
                                        )),
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
                  //makes sure the size of the grid is the same regardless of an image size
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
  _HomeState parent;

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
            /// testing if the selected tiles are same adds point vice versa
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              if (points == 800) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayAgain(
                          points: points, level: "level1", max_points: 800)),
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
