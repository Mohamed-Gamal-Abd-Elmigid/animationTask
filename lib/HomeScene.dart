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

  Alignment lastItemSelectedAlign = Alignment.center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // shape1.alignment = Alignment.center;
    // shape1.isMaxmized = true;
    // shape1.id = 1;
    // shape2.alignment = Alignment.bottomLeft;
    // shape2.isMaxmized = false;
    // shape2.id = 2;
    // shape3.alignment = Alignment.bottomCenter;
    // shape3.isMaxmized = false;
    // shape3.id = 3;
    // shape4.alignment = Alignment.bottomRight;
    // shape4.isMaxmized = false;
    // shape4.id = 4;

    // shapes = [shape1, shape2, shape3, shape4];
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
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Image.asset(
                  //     "assets/logo.jpg",
                  //     width: 100,
                  //     height: 100,
                  //   ),
                  // ),

                  AnimatedAlign(
                    alignment: shape1.alignment,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    onEnd: () {},
                    child: InkWell(
                      onTap: () {
                        if (shape1.isMaxmized) {
                          // drawGrid();
                          return;
                        }
                        setState(() {
                          _getMaximizedShape()!.alignment = shape1.alignment;
                          _getMaximizedShape()!.isMaxmized = false;
                          shape1.alignment = Alignment.center;
                          shape1.isMaxmized = true;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                        vsync: this,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          width: shape1.isMaxmized ? 200 : 100,
                          height: shape1.isMaxmized ? 200 : 100,
                          child: const FlutterLogo(size: 100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedAlign(
                    alignment: shape2.alignment,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    onEnd: () {},
                    child: InkWell(
                      onTap: () {
                        if (shape2.isMaxmized) return;
                        setState(() {
                          _getMaximizedShape()!.alignment = shape2.alignment;
                          _getMaximizedShape()!.isMaxmized = false;
                          shape2.alignment = Alignment.center;
                          shape2.isMaxmized = true;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                        vsync: this,
                        child: Container(
                          width: shape2.isMaxmized ? 200 : 100,
                          height: shape2.isMaxmized ? 200 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                          ), // child: const FlutterLogo(size: 100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedAlign(
                    alignment: shape3.alignment,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: InkWell(
                      onTap: () {
                        if (shape3.isMaxmized) return;
                        setState(() {
                          lastItemSelectedAlign = shape3.alignment;
                          _getMaximizedShape()!.alignment = shape3.alignment;
                          _getMaximizedShape()!.isMaxmized = false;
                          shape3.alignment = Alignment.center;
                          shape3.isMaxmized = true;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeIn,
                        vsync: this,
                        child: Container(
                          width: shape3.isMaxmized ? 200 : 100,
                          height: shape3.isMaxmized ? 200 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87,
                          ), // child: const FlutterLogo(size: 100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedAlign(
                    alignment: shape4.alignment,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: InkWell(
                      onTap: () {
                        if (shape4.isMaxmized) return;
                        setState(() {
                          lastItemSelectedAlign = shape4.alignment;
                          _getMaximizedShape()!.alignment = shape4.alignment;
                          _getMaximizedShape()!.isMaxmized = false;
                          shape4.alignment = Alignment.center;
                          shape4.isMaxmized = true;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeIn,
                        vsync: this,
                        child: Container(
                          width: shape4.isMaxmized ? 200 : 100,
                          height: shape4.isMaxmized ? 200 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Shape? _getMaximizedShape() {
    for (var shape in shapes) {
      if (shape.isMaxmized) return shape;
    }
    return shapes.length > 0 ? shapes[0] : null;
  }
}
