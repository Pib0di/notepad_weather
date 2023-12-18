import 'package:flutter/material.dart';

class CardMonth extends StatelessWidget {
  const CardMonth({required this.listDate, required this.monthName, super.key});

  final String monthName;
  final Future<List<Widget>> listDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(monthName),
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.9,
            child: FutureBuilder<List<Widget>>(
              future: listDate,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Ошибка: ${snapshot.error}');
                } else {
                  return GridView.count(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 7,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!,
                  );
                  // Text('Данные: ${snapshot.data!.hourly!.temperature_2m}');
                }
              },
            ),

            // GridView.count(
            //   mainAxisSpacing: 2,
            //   crossAxisSpacing: 2,
            //   crossAxisCount: 7,
            //   scrollDirection: Axis.horizontal,
            //   children: listDate,
            // ),
          ),
        ),
      ],
    );
  }
}
