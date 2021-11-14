import 'package:animatedtask/Model/Shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedItemContainer extends StatefulWidget {
  Shape shape;
  Color color;
  Shape? maximizedShape;
  Function onTapClick;
  AnimatedItemContainer(
      this.shape, this.color, this.maximizedShape, this.onTapClick);

  @override
  _AnimatedItemContainerState createState() => _AnimatedItemContainerState();
}

class _AnimatedItemContainerState extends State<AnimatedItemContainer>
    with TickerProviderStateMixin {
  Alignment lastItemSelectedAlign = Alignment.center;

  @override
  Widget build(BuildContext context) {
    print("Shape " + widget.shape.id.toString());
    print("Shape " + widget.shape.isMaxmized.toString());
    print("///////////////");

    return AnimatedAlign(
      alignment: widget.shape.alignment,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: InkWell(
        onTap: () {
          if (widget.shape.isMaxmized) {
            // drawGrid();
            return;
          }
          changeState();
          widget.onTapClick();
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
            width: widget.shape.isMaxmized ? 200 : 100,
            height: widget.shape.isMaxmized ? 200 : 100,
            child: const FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }

  changeState() {
    widget.maximizedShape!.alignment = widget.shape.alignment;
    widget.maximizedShape!.isMaxmized = false;
    widget.shape.alignment = Alignment.center;
    widget.shape.isMaxmized = true;
  }
}
