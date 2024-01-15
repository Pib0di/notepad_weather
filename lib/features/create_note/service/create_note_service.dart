import 'dart:collection';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notepad_weather/features/create_note/bloc/note_bloc.dart';
import 'package:notepad_weather/features/create_note/widget/drag_image.dart';
import 'package:notepad_weather/features/create_note/widget/drag_target_text.dart';
import 'package:notepad_weather/features/create_note/widget/image_picker_dialog.dart';

class CreateNoteService {
  static CreateNoteService? _instance;

  CreateNoteService._();

  static CreateNoteService get instance {
    _instance ??= CreateNoteService._();
    return _instance!;
  }

  final LinkedHashMap<Key, Widget> _dataMap = LinkedHashMap<Key, Widget>();

  late BuildContext context;
  int index = 0;
  late NoteBloc bloc;

  void insert(String secondString, int index, Key key) {
    final image = _dataMap.remove(key)!;

    final dragTarget = DragTargetText(
      str: secondString,
      key: UniqueKey(),
    );

    final entriesList = _dataMap.entries.toList().sublist(0, index - 1);
    final newDataMap = Map.fromEntries(entriesList);
    newDataMap[image.key!] = image;
    newDataMap[dragTarget.key!] = dragTarget;
    final entriesList2 = _dataMap.entries
        .toList()
        .sublist(_dataMap.length > index ? index : index - 1, _dataMap.length);
    newDataMap.addAll(Map.fromEntries(entriesList2));

    _dataMap
      ..clear()
      ..addAll(newDataMap);

    bloc.add(UpdateNoteEvent(this, 1));
  }

  List<Widget> getList() {
    return _dataMap.values.toList();
  }

  int getIndexByKey(Key key) {
    return _dataMap.keys.toList().indexOf(key);
  }

  Widget? getByIndex(int index) {
    return _dataMap.values.toList()[index];
  }

  Widget? getByKey(Key key) {
    return _dataMap[key];
  }

  String split(int newPosition, TextEditingController textController) {
    final str = textController.text.substring(newPosition);
    textController.text = textController.text.substring(0, newPosition);
    return str;
  }

  void init(BuildContext context, NoteBloc bloc) {
    this.context = context;
    this.bloc = bloc;
    if (_dataMap.isEmpty) {
      final Widget dragTargetText = DragTargetText(
        key: UniqueKey(),
      );
      _dataMap[dragTargetText.key!] = dragTargetText;
      debugPrint('${dragTargetText.key!}');
    }
  }

  int moveCursor(
    Offset localPosition,
    Size size,
    TextEditingController textController,
  ) {
    final localPosDy = localPosition.dy;
    final numLines = textController.text.split('\n').length;
    final pixelsInLine = size.height / numLines;
    final calculatedLine = localPosDy / pixelsInLine;

    //переносим коретку на нужную линию и в конец строки
    final newPosition = textController.text
            .split('\n')
            .sublist(0, calculatedLine.toInt() + 1)
            .fold<int>(0, (prev, element) => prev + element.length + 1) -
        1;

    final newSelection = TextSelection.collapsed(
      offset: newPosition,
    );
    textController.selection = newSelection;

    return newPosition;
  }

  Future<void> addImage(File pickedImage) async {
    final Widget draggableImage = DraggableImage(
      key: UniqueKey(),
      pickedImage: pickedImage,
    );
    _dataMap[draggableImage.key!] = draggableImage;

    final Widget dragTargetText = DragTargetText(
      key: UniqueKey(),
    );
    _dataMap[dragTargetText.key!] = dragTargetText;
    bloc.add(UpdateNoteEvent(this, 1));
  }

  Future<XFile?> showImageSourceDialog(BuildContext context) async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => const ImagePickerDialog(),
    );

    if (source == null) {
      return null;
    }

    final pickedFile = await ImagePicker().pickImage(source: source);

    return pickedFile;
  }
}
