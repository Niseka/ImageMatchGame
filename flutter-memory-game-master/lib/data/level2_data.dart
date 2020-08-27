import 'package:memory_game/models/TileModel.dart';

String selectedTile = "";
int selectedIndex;
bool selected = true;
int points = 0;

List<TileModel> myPairs = new List<TileModel>();
List<bool> clicked = new List<bool>();

List<bool> getClicked() {
  List<bool> yoClicked = new List<bool>();
  List<TileModel> myairs = new List<TileModel>();
  myairs = getPairs();
  for (int i = 0; i < myairs.length; i++) {
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel> getPairs() {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  //1
  tileModel.setImageAssetPath("assets/10.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/11.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/12.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/13.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/14.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/15.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/16.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/17.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //9
  tileModel.setImageAssetPath("assets/18.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //10
  tileModel.setImageAssetPath("assets/19.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //11
  tileModel.setImageAssetPath("assets/21.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //12
  tileModel.setImageAssetPath("assets/22.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestionPairs() {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  //1
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //9
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //10
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //11
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //12
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}
