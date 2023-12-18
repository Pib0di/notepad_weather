import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad_weather/features/create_note/bloc/note_bloc.dart';
import 'package:notepad_weather/features/create_note/service/create_note_service.dart';

class DragTargetText extends StatefulWidget {
  DragTargetText({this.str, super.key});
  final TextEditingController textController = TextEditingController();

  final String? str;

  @override
  State<DragTargetText> createState() => _DragTargetTextState();
}

class _DragTargetTextState extends State<DragTargetText> {
  final NoteBloc noteBloc = NoteBloc();
  CreateNoteService service = CreateNoteService.instance;
  @override
  void initState() {
    super.initState();
  }

  void state() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    widget.textController.text = widget.str ?? widget.textController.text;
    print(widget.textController.text);
    var newPosition = 0;

    return BlocProvider(
      create: (BuildContext context) => NoteBloc(),
      child: DragTarget<Key>(
        onLeave: (details) {
          focusNode.unfocus();
        },
        onMove: (details) {
          focusNode.requestFocus();

          final globalPosition = details.offset;
          final renderBox = (context.findRenderObject() as RenderBox);
          final localPosition =
              renderBox.globalToLocal(globalPosition) + const Offset(70, 70);
          final size = renderBox.size;

          newPosition =
              service.moveCursor(localPosition, size, widget.textController);
        },
        onAccept: (key) {
          final index = service.getIndexByKey(context.widget.key!) + 1;
          final secondString =
              service.split(newPosition, widget.textController);

          service.insert(secondString, index, key);
          // service.bloc.add(UpdateNoteEvent(1));
        },
        builder: (context, candidateData, rejectedData) {
          return TextField(
            style: const TextStyle(
                // height: 1,
                ),
            focusNode: focusNode,
            controller: widget.textController,
            maxLines: null,
          );
        },
      ),
    );
  }
}
