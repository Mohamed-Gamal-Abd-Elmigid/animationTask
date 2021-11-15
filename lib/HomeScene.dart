import 'package:animatedtask/UI/AppAssets.dart';
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
  Shape? selectedShape;

  var shape1 =
      Shape(Alignment.center, true, 1, "Smart Cities", AppAssets.SHAPE1_IMAGE);
  var shape2 = Shape(Alignment.bottomLeft, false, 2, "Digital Transformation",
      AppAssets.SHAPE2_IMAGE);
  var shape3 = Shape(
      Alignment.bottomCenter, false, 3, "Security", AppAssets.SHAPE3_IMAGE);
  var shape4 =
      Shape(Alignment.bottomRight, false, 4, "Health", AppAssets.SHAPE4_IMAGE);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shapes.add(shape1);
    shapes.add(shape2);
    shapes.add(shape3);
    shapes.add(shape4);
    drawGrid();
  }

  //                color: Colors.black87,
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/logo.jpg",
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: Stack(
                    children: [
                      _getMaximizedShape() != null
                          ? Align(
                              alignment: Alignment.center,
                              child: Text(
                                selectedShape != null
                                    ? selectedShape!.title
                                    : "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            )
                          : Container(),
                      AnimatedItemContainer(shape1, _getMaximizedShape(), () {
                        setState(() {
                          selectedShape = shape1;
                        });
                      }, () {
                        drawBottomItems();
                      }, () {
                        drawGrid();
                      }),
                      AnimatedItemContainer(shape2, _getMaximizedShape(), () {
                        setState(() {
                          selectedShape = shape2;
                        });
                      }, () {
                        drawBottomItems();
                      }, () {
                        drawGrid();
                      }),
                      AnimatedItemContainer(shape3, _getMaximizedShape(), () {
                        setState(() {
                          selectedShape = shape3;
                        });
                      }, () {
                        drawBottomItems();
                      }, () {
                        drawGrid();
                      }),
                      AnimatedItemContainer(shape4, _getMaximizedShape(), () {
                        setState(() {
                          selectedShape = shape4;
                        });
                      }, () {
                        drawBottomItems();
                      }, () {
                        drawGrid();
                      }),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  drawGrid() {
    shape1.alignment = Alignment.topLeft;
    shape1.isMaximized = false;
    shape2.alignment = Alignment.topRight;
    shape2.isMaximized = false;
    shape3.alignment = Alignment.bottomLeft;
    shape3.isMaximized = false;
    shape4.alignment = Alignment.bottomRight;
    shape4.isMaximized = false;
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

    for (int i = 0; i < shapes.length; i++) {
      if (!shapes[i].isMaximized) {
        shapes[i].alignment = alignments[alignmentIndex];
        alignmentIndex++;
      }
    }
  }
}
