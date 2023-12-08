import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/service/home_page_service.dart';
import 'package:notepad_weather/features/view_date/widget/line_chart_weather.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';
import 'package:notepad_weather/network/model/weather_current_day/weather_current_day.dart';

class ViewDate extends StatefulWidget {
  const ViewDate({super.key});

  @override
  State<ViewDate> createState() => _ViewDateState();
}

class _ViewDateState extends State<ViewDate> {
  late Dio dio;
  late Weather weather;
  // late WeatherCurrentDay weatherCurrentDay;

  @override
  void initState() {
    dio = Dio();
    weather = Weather(dio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Date date = ModalRoute.of(context)!.settings.arguments as Date;

    return Scaffold(
      backgroundColor: const Color(0xFF282E45),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.edit_note,
          size: 30,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Просмотр даты год - ${date.year}, month - ${date.month}, day - ${date.day}',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now());
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              FutureBuilder<WeatherCurrentDay>(
                future: weather.getWeatherCurrentDay(
                  12,
                  12,
                  "temperature_2m,cloud_cover_high,uv_index",
                  "jma_seamless",
                  1,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Ошибка: ${snapshot.error}');
                  } else {
                    return LineChartWeather(
                      weatherCurrentDay: snapshot.data!,
                    );
                    // Text('Данные: ${snapshot.data!.hourly!.temperature_2m}');
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Вы не оставляли заметок на этот день...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 23,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
