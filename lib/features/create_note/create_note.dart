import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad_weather/features/create_note/bloc/note_bloc.dart';

class CreateNote extends StatefulWidget {
  CreateNote({super.key});
  final NoteBloc bloc = NoteBloc();

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  void initState() {
    widget.bloc.state.service.init(context, widget.bloc);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteBloc, NoteState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if (state is UpdatedNoteState) {
          setState(() {});
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // bloc.add(UpdateNoteEvent(bloc.state.service ,bloc.state.height));
          },
          child: Text('${widget.bloc.state.height}'),
        ),
        appBar: AppBar(
          title: const Text('создание заметки'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.radio_button_checked_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.photo_camera_outlined),
              onPressed: () async {
                final pickedImage = await widget.bloc.state.service
                    .showImageSourceDialog(context);

                if (pickedImage != null) {
                  setState(() {
                    widget.bloc.state.service.addImage(
                      File(pickedImage.path),
                    );
                  });
                } else {
                  //todo изображение не выбрано
                  debugPrint('изображение не выбрано');
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.draw_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mic_none_rounded),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocListener<NoteBloc, NoteState>(
          bloc: widget.bloc,
          listener: (context, state) {
            if (state is UpdatedNoteState) {
              setState(() {});
            }
          },
          child: ListView(
            key: UniqueKey(),
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                // children: bloc.state.service.dataList,
                children: widget.bloc.state.service.getList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
