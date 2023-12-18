import 'package:flutter/material.dart';
import 'package:notepad_weather/features/home_page/service/home_page_service.dart';
import 'package:notepad_weather/features/view_date/view_date.dart';

class DateBlock extends StatelessWidget {
  const DateBlock({required this.date, this.weatherIco, super.key});
  final Date date;
  final Image? weatherIco;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ViewDate(),
            settings: RouteSettings(
              arguments: date,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   fit: BoxFit.cover, image: null,
          //   // image: weatherIco,
          // ),
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              if (weatherIco != null)
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, top: 10),
                  child: weatherIco!,
                ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${date.day}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '1⁄2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
