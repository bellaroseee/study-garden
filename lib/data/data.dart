import 'package:flutter/material.dart';
import 'package:garudahacks/models/TileModel.dart';

String selectedTile = "";
int selectedIndex;
bool selected = true;
int points = 0;

List<TileModel> myPairs = new List<TileModel>();
List<bool> clicked = new List<bool>();

List<TileModel> getPairs() {
  print("creating Assets");
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  //1
  tileModel.setImage(Image(image: AssetImage('assets/peach.png')));
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);

  // tileModel = new TileModel();

  // //2
  // tileModel.setImage(Image(image: AssetImage('assets/hippo.png')));
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // pairs.add(tileModel);
  // tileModel = new TileModel();

  print("Done Creating Assets");

  return pairs;
}
