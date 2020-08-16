import 'package:flutter/widgets.dart';

class TileModel {
  String imageAssetPath;
  Image image;
  bool isSelected;

  TileModel({this.imageAssetPath, this.isSelected, this.image});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  bool getIsSelected() {
    return isSelected;
  }

  void setImage(Image getImage) {
    image = getImage;
  }

  Image getImage() {
    return image;
  }
}
