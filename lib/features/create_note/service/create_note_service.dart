import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNoteService {
  final List<Widget> dataList = [];
  final textController = TextEditingController();
  late final Widget textField;
  late File? pickedImageFile;
  late BuildContext context;

  void init(BuildContext context) {
    this.context = context;

    //todo перемещение каретки ввода за указателем в конец строки или текст
    void moveCursor(BuildContext context, Offset localPosition) {
      int localPos = (localPosition.dy).toInt();

      if (localPos <= textController.text.length && localPos >= 0) {
        textController.text.substring(0, localPos).split('\n').length;

        int startOfNextLine = textController.text.indexOf('\n', localPos);
        if (startOfNextLine == -1) {
          startOfNextLine = textController.text.length;
        }

        TextSelection newSelection = TextSelection.collapsed(
          offset: startOfNextLine,
        );

        textController.selection = newSelection;
      }
    }

    FocusNode focusNode = FocusNode();
    textField = SizedBox(
      child: DragTarget<String>(
        onMove: (details) {
          //todo вычисление координат для перемещения каретки ввода
          // double globalX = details.offset.dx;
          // double globalY = details.offset.dy;
          //
          // RenderBox renderBox = context.findRenderObject() as RenderBox;
          // Offset localOffset = renderBox.globalToLocal(Offset(globalX, globalY));

          print("globalOffset=> ${details.offset}, localOffset => ");
        },
        builder: (context, candidateData, rejectedData) {
          return TextField(
            focusNode: focusNode,
            onChanged: (details) {
              debugPrint(details.runes.string);
            },
            // key: textFieldKey,
            controller: textController,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          );
        },
      ),
    );

    dataList.add(textField);
  }

  void addImage(File pickedImage) {
    Offset dragAnchorStrategy(
        Draggable<Object> d, BuildContext context, Offset point) {
      return Offset(d.feedbackOffset.dx + 70, d.feedbackOffset.dy + 70);
    }

    dataList.addAll([
      LongPressDraggable(
        dragAnchorStrategy: dragAnchorStrategy,
        // feedbackOffset: Offset(70, 70),
        // key: key,
        data: 'Drag me!',
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
        child: Image.file(pickedImage),
      ),
      textField,
    ]);
  }

  Future<XFile?> showImageSourceDialog(BuildContext context) async {
    ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Choose image source'),
        actions: [
          ElevatedButton(
            child: const Text('Camera'),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          ElevatedButton(
            child: const Text('Gallery'),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );

    if (source == null) return null;

    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return null;

    return pickedFile;
  }
}
