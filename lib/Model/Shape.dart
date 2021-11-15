import 'package:flutter/cupertino.dart';

class Shape {
  int id;
  bool isMaximized;
  Alignment alignment;
  String title;
  String imagePath;

  Shape(this.alignment, this.isMaximized, this.id, this.title, this.imagePath);
}
