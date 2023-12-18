import 'dart:io';

import 'package:flutter/material.dart';

class DraggableImage extends StatelessWidget {
  const DraggableImage({required this.pickedImage, super.key});

  final File pickedImage;

  Offset dragAnchorStrategy(
    Draggable<Object> d,
    BuildContext context,
    Offset point,
  ) {
    return Offset(d.feedbackOffset.dx + 70, d.feedbackOffset.dy + 70);
  }

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      dragAnchorStrategy: dragAnchorStrategy,
      // feedbackOffset: Offset(70, 70),
      // key: key,
      data: key,
      onDragStarted: () {
        // final RenderBox renderBox =
        //     columnKey.currentContext?.findRenderObject() as RenderBox;
        //
        // final Size size = renderBox.size;
        // print('Size: ${size.width}, ${size.height}');
      },
      onDragUpdate: (details) {},
      feedback: Opacity(
        opacity: 0.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 140,
            height: 140,
            child: Image.file(
              pickedImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(pickedImage),
      ),
    );
  }
}
