import 'package:animatedtask/Model/Shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedItemContainer extends StatefulWidget {
  Shape shape;
  Color color;
  Shape? maximizedShape;
  Function onTapClick;
  Function drawBottomItems;
  Function drawGrid;
  AnimatedItemContainer(this.shape, this.color, this.maximizedShape,
      this.onTapClick, this.drawBottomItems, this.drawGrid);

  @override
  _AnimatedItemContainerState createState() => _AnimatedItemContainerState();
}

class _AnimatedItemContainerState extends State<AnimatedItemContainer>
    with TickerProviderStateMixin {
  bool isBoarder = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.shape.alignment,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutQuad,
      child: GestureDetector(
        onTap: () {
          changeState();
          widget.onTapClick();
        },
        child: AnimatedSize(
          duration: const Duration(seconds: 2),
          curve: Curves.easeOutQuint,
          vsync: this,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color:
                    widget.shape.isMaximized ? Color(0xFF12d6d4) : Colors.black,
                width: 4,
              ),
              color: widget.color,
            ),
            width: widget.shape.isMaximized ? 200 : 100,
            height: widget.shape.isMaximized ? 200 : 100,
            child: Image.asset(
              widget.shape.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            // child: const FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }

  changeState() {
    if (widget.shape.isMaximized) {
      widget.drawGrid();
      return;
    }

    if (widget.maximizedShape != null) {
      widget.maximizedShape!.alignment = widget.shape.alignment;
      widget.maximizedShape!.isMaximized = false;
      setItemAsMaximized();
    } else {
      // when user in grid state then, Maximized item = null
      setItemAsMaximized();
      widget.drawBottomItems();
    }
  }

  setItemAsMaximized() {
    widget.shape.alignment = Alignment.topCenter;
    widget.shape.isMaximized = true;
  }
}
