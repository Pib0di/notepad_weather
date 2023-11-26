import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/widget/card_month.dart';

class HomePageService {
  final DateTime dateTimeNow = DateTime.now();
  final List<CardMonth> cardMonth = [];

  void initial() {
    DateTime dateTime;
    int dayInMonth;
    for (int i = dateTimeNow.month - 5; i != dateTimeNow.month + 5; ++i) {
      dateTime = DateTime(dateTimeNow.year, i, 1);
      dayInMonth = DateTime(dateTimeNow.year, i + 1, 0).day;

      cardMonth.add(
        CardMonth(
          listDate: generateDateBlock(dateTime.weekday, dayInMonth),
          monthName: getMonthName(i % 12 == 0 ? 12 : i % 12),
        ),
      );
    }
  }

  List<Widget> generateDateBlock(int firstDayWeek, int dayInMonth) {
    List<Widget> listDate = [];

    //add empty date
    if (firstDayWeek != 1) {
      listDate
          .addAll(List.generate(firstDayWeek - 1, (index) => const SizedBox()));
    }

    listDate.addAll(
      List.generate(
        dayInMonth,
        (index) => InkWell(
          onTap: () {},
          child: Container(
            color: Colors.blue,
            child: Text("${index + 1}"),
          ),
        ),
      ),
    );

    return listDate;
  }
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
