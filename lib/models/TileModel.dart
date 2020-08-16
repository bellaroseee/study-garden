import 'package:flutter/widgets.dart';

class TileModel {
  Image image;

  TileModel({this.image});
  void setImage(Image getImage) {
    image = getImage;
  }

  Image getImage() {
    return image;
  }
}
