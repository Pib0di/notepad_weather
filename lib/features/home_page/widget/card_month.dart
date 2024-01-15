import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/widget/date_block.dart';

class CardMonth extends StatelessWidget {
  const CardMonth({
    required this.listDateBlock,
    required this.monthName,
    required this.date,
    super.key,
  });

  final DateTime date;
  final String monthName;
  final List<DateBlock> listDateBlock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(monthName),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return AspectRatio(
                aspectRatio: 0.9,
                child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 7,
                  scrollDirection: Axis.horizontal,
                  children: listDateBlock,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
