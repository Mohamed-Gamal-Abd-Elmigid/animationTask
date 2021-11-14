import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/Shape.dart';
import 'Widget/animatedItemContainer.dart';

class HomeScene extends StatefulWidget {
  const HomeScene({Key? key}) : super(key: key);

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> with TickerProviderStateMixin {
  List<Shape> shapes = [];

  var shape1 = Shape(Alignment.center, true, 1);
  var shape2 = Shape(Alignment.bottomLeft, false, 2);
  var shape3 = Shape(Alignment.bottomCenter, false, 3);
  var shape4 = Shape(Alignment.bottomRight, false, 4);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawGrid();
    shapes.add(shape1);
    shapes.add(shape2);
    shapes.add(shape3);
    shapes.add(shape4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black87,
            child: Container(
              color: Colors.teal,
              width: 400,
              height: 400,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/logo.jpg",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  AnimatedItemContainer(
                      shape1, Colors.white, _getMaximizedShape(), () {
                    setState(() {});
                  }, () {
                    drawBottomItems();
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape2, Colors.yellow, _getMaximizedShape(), () {
                    setState(() {});
                  }, () {
                    drawBottomItems();
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape3, Colors.red, _getMaximizedShape(), () {
                    setState(() {});
                  }, () {
                    drawBottomItems();
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape4, Colors.green, _getMaximizedShape(), () {
                    setState(() {});
                  }, () {
                    drawBottomItems();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  drawGrid() {
    setState(() {
      shape1.alignment = Alignment.centerLeft;
      shape1.isMaximized = false;
      shape2.alignment = Alignment.centerRight;
      shape2.isMaximized = false;
      shape3.alignment = Alignment.bottomLeft;
      shape3.isMaximized = false;
      shape4.alignment = Alignment.bottomRight;
      shape4.isMaximized = false;
    });
  }

  Shape? _getMaximizedShape() {
    for (var shape in shapes) {
      if (shape.isMaximized) return shape;
    }
    return null;
  }

  drawBottomItems() {
    int alignmentIndex = 0;

    List<Alignment> alignments = [];
    alignments.add(Alignment.bottomLeft);
    alignments.add(Alignment.bottomCenter);
    alignments.add(Alignment.bottomRight);

    setState(() {
      for (int i = 0; i < shapes.length; i++) {
        if (!shapes[i].isMaximized) {
          shapes[i].alignment = alignments[alignmentIndex];
          alignmentIndex++;
        }
      }
    });
  }
}
