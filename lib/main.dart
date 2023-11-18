import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Diary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF63D0FF)),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}