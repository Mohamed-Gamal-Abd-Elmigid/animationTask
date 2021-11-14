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
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape2, Colors.yellow, _getMaximizedShape(), () {
                    setState(() {});
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape3, Colors.red, _getMaximizedShape(), () {
                    setState(() {});
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedItemContainer(
                      shape4, Colors.green, _getMaximizedShape(), () {
                    setState(() {});
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
      // shape1.alignment = Alignment.centerLeft;
      // shape1.isMaxmized = false;
      // shape2.alignment = Alignment.centerRight;
      // shape2.isMaxmized = false;
      // shape3.alignment = Alignment.bottomLeft;
      // shape3.isMaxmized = false;
      // shape4.alignment = Alignment.bottomRight;
      // shape4.isMaxmized = false;
    });
  }

  Shape? _getMaximizedShape() {
    for (var shape in shapes) {
      if (shape.isMaxmized) return shape;
    }
    return shapes.length > 0 ? shapes[0] : null;
  }
}
