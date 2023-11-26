import 'package:flutter/material.dart';
import 'package:notepad_weather/features/create_note/create_note.dart';
import 'package:notepad_weather/features/home_page/service/home_page_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageService homePageService = HomePageService();

  @override
  void initState() {
    super.initState();
    homePageService.initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Погодный календарь'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.question_mark_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNote()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homePageService.cardMonth.length,
          padding: const EdgeInsets.all(8.0),
          controller: ScrollController(
            //todo сделать чтобы список скролился с середины (GlobalKey or Bloc)
            // middle of the list
            initialScrollOffset: (homePageService.cardMonth.length * 402) / 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return homePageService.cardMonth[index];
          }),
    );
  }
}
