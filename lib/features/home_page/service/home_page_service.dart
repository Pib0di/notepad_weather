import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/bloc/home_page_bloc.dart';
import 'package:notepad_weather/features/home_page/widget/card_month.dart';
import 'package:notepad_weather/features/home_page/widget/date_block.dart';
import 'package:notepad_weather/generated/assets.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';
import 'package:notepad_weather/network/model/weather/weather_entity.dart';

class HomePageService {
  // Приватное статическое поле, которое хранит экземпляр синглтона
  static final HomePageService _singleton = HomePageService._internal();

  // Приватный конструктор, который вызывается только внутри класса
  HomePageService._internal();

  // Фабричный конструктор, возвращающий экземпляр синглтона
  factory HomePageService() {
    return _singleton;
  }

  final DateTime dateTimeNow = DateTime.now();
  final LinkedHashMap<DateTime, CardMonth> cardMonth =
      LinkedHashMap<DateTime, CardMonth>();
  Dio dio = Dio();
  late Weather weather;
  ScrollController? scrollController;
  late HomePageBloc bloc;

  Future<WeatherEntity> getWeatherWeek() {
    weather = Weather(dio);
    return weather.getWeatherWeek(
      12,
      12,
      'temperature_2m,cloud_cover_high',
      'apparent_temperature_max,apparent_temperature_min',
      'jma_seamless',
    );
  }

  void addWeather(WeatherEntity result) {
    for (var i = 0; i < result.daily.time.length; ++i) {
      final dateTime = DateTime.parse(result.daily.time[i]);
      final findDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        1,
      );

      if (!cardMonth.containsKey(findDateTime)) {
        continue;
      }

      //add empty date
      final findDay = dateTime.day - 1;

      final cardMonthTemp = CardMonth(
        key: UniqueKey(),
        listDateBlock: cardMonth[findDateTime]!.listDateBlock,
        monthName: cardMonth[findDateTime]!.monthName,
        date: cardMonth[findDateTime]!.date,
      );

      cardMonthTemp.listDateBlock[findDay] = DateBlock(
        temperatureMax: result.daily.apparentTemperatureMax[i].toInt(),
        temperatureMin: result.daily.apparentTemperatureMin[i].toInt(),
        weatherIco: Image.asset(Assets.assetImageFreeIconSun4814268),
        date: dateTime,
      );
      cardMonth[findDateTime] = cardMonthTemp;
    }
    bloc.add(Increment());
  }

  void initial(BuildContext context, HomePageBloc bloc) {
    this.bloc = bloc;
    getWeatherWeek().then(addWeather);
    for (var i = dateTimeNow.month - 5; i != dateTimeNow.month + 5; ++i) {
      final dateTime = DateTime(dateTimeNow.year, i);
      cardMonth.putIfAbsent(
        dateTime,
        () => CardMonth(
          date: dateTime,
          listDateBlock: generateDateBlock(dateTime, i),
          monthName: getMonthName(i % 12 == 0 ? 12 : i % 12),
        ),
      );
    }
  }

  void addCardMonth() {
    final nextDate = DateTime(
      cardMonth.values.last.date.year,
      cardMonth.values.last.date.month + 1,
    );
    cardMonth.putIfAbsent(
      nextDate,
      () => CardMonth(
        listDateBlock: generateDateBlock(nextDate, nextDate.month),
        date: nextDate,
        monthName: getMonthName(nextDate.month),
      ),
    );
  }

  List<DateBlock> generateDateBlock(
    DateTime dateTime,
    int month,
  ) {
    final listDate = <DateBlock>[];
    final dayInMonth = DateTime(dateTime.year, month + 1, 0).day;
    final firstDayWeek = dateTime.weekday;
    // final weatherWeek = await getWeatherWeek();

    //add empty date
    if (firstDayWeek != 1) {
      listDate.addAll(
        List.generate(
          firstDayWeek - 1,
          (index) => const DateBlock(date: null),
        ),
      );
    }
    listDate.addAll(
      List.generate(
        dayInMonth,
        (index) {
          final date = DateTime(
            dateTime.year,
            month % 12 == 0 ? 12 : month % 12,
            index + 1,
          );
          return DateBlock(date: date);
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
