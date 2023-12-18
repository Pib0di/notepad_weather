import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/widget/card_month.dart';
import 'package:notepad_weather/features/home_page/widget/date_block.dart';
import 'package:notepad_weather/generated/assets.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';
import 'package:notepad_weather/network/model/weather/weather_entity.dart';

class HomePageService {
  final DateTime dateTimeNow = DateTime.now();
  final List<CardMonth> cardMonth = [];
  Dio dio = Dio();
  late Weather weather;

  Future<WeatherEntity> getWeather() {
    weather = Weather(dio);
    return weather.getWeatherWeek(
      12,
      12,
      'temperature_2m,cloud_cover_high',
      'apparent_temperature_max,apparent_temperature_min',
      'jma_seamless',
    );
  }

  void initial(BuildContext context) {
    for (var i = dateTimeNow.month - 5; i != dateTimeNow.month + 5; ++i) {
      cardMonth.add(
        CardMonth(
          listDate: generateDateBlock(dateTimeNow, i, context),
          monthName: getMonthName(i % 12 == 0 ? 12 : i % 12),
        ),
      );
    }
  }

  Future<List<Widget>> generateDateBlock(
    DateTime dateTimeNow,
    int month,
    BuildContext context,
  ) async {
    final listDate = <Widget>[];
    final dateTime = DateTime(dateTimeNow.year, month, 1);
    final dayInMonth = DateTime(dateTimeNow.year, month + 1, 0).day;
    final firstDayWeek = dateTime.weekday;
    final weatherEntity = await getWeather();
    Image? weatherIco;

    //add empty date
    if (firstDayWeek != 1) {
      listDate.addAll(
        List.generate(firstDayWeek - 1, (index) => const SizedBox()),
      );
    }
    listDate.addAll(
      List.generate(
        dayInMonth,
        (index) {
          final date = Date(
            day: index + 1,
            month: month % 12 == 0 ? 12 : month % 12,
            year: dateTimeNow.year,
          );
          for (var i = 0; i < weatherEntity.hourly.time.length; ++i) {
            final dateTime = DateTime.parse(weatherEntity.hourly.time[i]);
            final weatherDate = Date(
              day: dateTime.day,
              month: dateTime.month,
              year: dateTime.year,
            );

            if (date.day == weatherDate.day &&
                date.month == weatherDate.month &&
                date.year == weatherDate.year) {
              weatherIco = Image.asset(Assets.assetImageFreeIconSun4814268);
            }
          }
          return DateBlock(
            // temperatureMax:
            // temperatureMin:
            weatherIco: weatherIco,
            date: date,
          );
        },
      ),
    );

    return listDate;
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }
}

class Date {
  const Date({
    required this.day,
    required this.month,
    required this.year,
  });

  final int day;
  final int month;
  final int year;
}
