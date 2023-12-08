import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/widget/card_month.dart';
import 'package:notepad_weather/features/view_date/view_date.dart';

class HomePageService {
  final DateTime dateTimeNow = DateTime.now();
  final List<CardMonth> cardMonth = [];

  void initial(BuildContext context) {
    for (int i = dateTimeNow.month - 5; i != dateTimeNow.month + 5; ++i) {
      cardMonth.add(
        CardMonth(
          listDate: generateDateBlock(dateTimeNow, i, context),
          monthName: getMonthName(i % 12 == 0 ? 12 : i % 12),
        ),
      );
    }
  }

  List<Widget> generateDateBlock(
    DateTime dateTimeNow,
    int month,
    BuildContext context,
  ) {
    List<Widget> listDate = [];
    DateTime dateTime = DateTime(dateTimeNow.year, month, 1);
    int dayInMonth = DateTime(dateTimeNow.year, month + 1, 0).day;
    int firstDayWeek = dateTime.weekday;

    //add empty date
    if (firstDayWeek != 1) {
      listDate.addAll(
        List.generate(firstDayWeek - 1, (index) => const SizedBox()),
      );
    }
    listDate.addAll(
      List.generate(
        dayInMonth,
        (index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ViewDate(),
                settings: RouteSettings(
                  arguments: Date(
                    day: index + 1,
                    month: month % 12 == 0 ? 12 : month % 12,
                    year: dateTimeNow.year,
                  ),
                ),
              ),
            );
          },
          child: Container(
            color: Colors.blue,
            child: Text("${index + 1}"),
          ),
        ),
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
