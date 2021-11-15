import 'package:animatedtask/Model/Shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedItemContainer extends StatefulWidget {
  Shape shape;
  Shape? maximizedShape;
  Function onTapClick;
  Function drawBottomItems;
  Function drawGrid;
  AnimatedItemContainer(this.shape, this.maximizedShape, this.onTapClick,
      this.drawBottomItems, this.drawGrid);

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
            width: widget.shape.isMaximized ? 200 : 130,
            height: widget.shape.isMaximized ? 200 : 130,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: widget.shape.isMaximized
                          ? Color(0xFF12d6d4)
                          : Colors.transparent,
                      width: 4,
                    ),
                  ),
                  width: widget.shape.isMaximized ? 190 : 90,
                  height: widget.shape.isMaximized ? 190 : 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.shape.imagePath,
                      width: widget.shape.isMaximized ? 200 : 50,
                      height: widget.shape.isMaximized ? 200 : 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: widget.shape.isMaximized == false,
                  child: Text(
                    "${widget.shape.title}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                )
              ],
            ),
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
      setItemAsMaximized();
      widget.drawBottomItems();
    }
  }

  setItemAsMaximized() {
    widget.shape.alignment = Alignment.topCenter;
    widget.shape.isMaximized = true;
  }
}
