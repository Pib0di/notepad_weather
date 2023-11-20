import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notepad_weather/features/create_note/service/create_note_service.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final createNoteService = CreateNoteService();

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    createNoteService.init();

    textController = createNoteService.textController;
    textController.text = " 🧭 🏳️\u200d🌈 a;sldkfj  🧭 🏳️\u200d🌈";
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("создание заметки"),
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
              final pickedImage =
                  await createNoteService.showImageSourceDialog(context);

              if (pickedImage != null) {
                setState(() {
                  createNoteService.addImage(
                    File(pickedImage.path)!,
                  );
                });
              } else {
                //todo изображение не выбрано
                print('изображение не выбрано');
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: createNoteService.dataList,
            ),
          ),
        ],
      ),
    );
  }
}
