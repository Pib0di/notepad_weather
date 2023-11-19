import 'package:flutter/material.dart';

class CardMonth extends StatelessWidget {
  const CardMonth({super.key, required this.listDate, required this.monthName});

  final String monthName;
  final List<Widget> listDate;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(monthName),
      Expanded(
        child: AspectRatio(
          aspectRatio: 0.9,
          child: GridView.count(
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            crossAxisCount: 7,
            scrollDirection: Axis.horizontal,
            children: listDate,
          ),
        ),
      ),
    ]);
  }
}
