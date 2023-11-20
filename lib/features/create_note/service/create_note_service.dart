import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNoteService {
  final List<Widget> dataList = [];
  final textController = TextEditingController();
  late final TextField textField;
  late File? pickedImageFile;

  void init() {
    textField = TextField(
      controller: textController,
      maxLines: null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );

    dataList.add(textField);
  }

  void addImage(File pickedImage) {
    dataList.addAll([
      Image.file(pickedImage),
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
