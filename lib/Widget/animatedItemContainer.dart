import 'package:animatedtask/Model/Shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedItemContainer extends StatefulWidget {
  Alignment alignment;
  bool isMaxmized;
  List<Shape> shapes;
  Color color;
  AnimatedItemContainer(
      this.alignment, this.isMaxmized, this.shapes, this.color);

  @override
  _AnimatedItemContainerState createState() => _AnimatedItemContainerState();
}

class _AnimatedItemContainerState extends State<AnimatedItemContainer>
    with TickerProviderStateMixin {
  Alignment lastItemSelectedAlign = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.alignment,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      onEnd: () {},
      child: InkWell(
        onTap: () {
          if (widget.isMaxmized) {
            // drawGrid();
            return;
          }
          setState(() {
            changeState();
          });
        },
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          vsync: this,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: widget.color,
            ),
            width: widget.isMaxmized ? 200 : 100,
            height: widget.isMaxmized ? 200 : 100,
            child: const FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }

  Shape? _getMaximizedShape() {
    for (var shape in widget.shapes) {
      if (shape.isMaxmized) return shape;
    }
    return widget.shapes.length > 0 ? widget.shapes[0] : null;
  }

  changeState() {
    _getMaximizedShape()!.alignment = widget.alignment;
    _getMaximizedShape()!.isMaxmized = false;
    widget.alignment = Alignment.center;
    widget.isMaxmized = true;
    setState(() {});
  }

  // Shape? _getTempShape() {
  //   print("sss" + widget.shapes.length.toString());
  //   for (var shape in widget.shapes) {
  //     if (shape.alignment == Alignment.center) return shape;
  //   }
  //   return widget.shapes.length > 0 ? widget.shapes[0] : null;
  // }
}
