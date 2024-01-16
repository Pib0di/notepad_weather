import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:notepad_weather/features/authentication/authentication.dart';
import 'package:notepad_weather/features/home_page/bloc/home_page_bloc.dart';
import 'package:notepad_weather/features/home_page/home_page.dart';
import 'package:notepad_weather/firebase_options.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';
import 'package:notepad_weather/network/model/historical_weather/historical_weather.dart';
import 'package:notepad_weather/theme/theme.dart';

part 'router.dart';

Future<void> main() async {
  final response = await http.get(Uri.parse(
      'https://archive-api.open-meteo.com/v1/archive?latitude=12&longitude=12&start_date=2022-01-01&end_date=2022-12-31&daily=apparent_temperature_max,apparent_temperature_min'));
  if (response.statusCode == 200) {
    // Преобразование JSON-строки в объект Dart
    final Map<String, dynamic> data = await json.decode(response.body);

    // Вывод JSON в консоль
    debugPrint(data.toString());
  } else {
    // Если запрос не успешен, выведите сообщение об ошибке
    print('Failed to load data. Status code: ${response.statusCode}');
  }

  Dio dio = Dio();
  Weather weather = Weather(dio);
  Future<HistoricalWeather> getHistoricalWeather(Null _) async {
    return await weather.getHistoricalWeather(
      12,
      12,
      '2022-01-01',
      '2022-12-31',
      'apparent_temperature_max,apparent_temperature_min',
    );
  }

  Future<HistoricalWeather> getHistoricalWeatherr() async {
    return await compute(getHistoricalWeather, null);
  }

  // final historicalWeather = await getHistoricalWeather();
  final historicalWeather = await compute(getHistoricalWeather, null);
  debugPrint(historicalWeather.toString());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        // home: HomePage(),
        debugShowCheckedModeBanner: false,
        title: 'Weather Diary',
        theme: themeData,
      ),
    );
  }
}
