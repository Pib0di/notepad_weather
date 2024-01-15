import 'package:flutter/material.dart';
import 'package:notepad_weather/features/view_date/view_date.dart';

class DateBlock extends StatelessWidget {
  const DateBlock({
    required this.date,
    this.temperatureMax,
    this.temperatureMin,
    this.weatherIco,
    super.key,
  });

  final DateTime? date;
  final int? temperatureMax;
  final int? temperatureMin;
  final Image? weatherIco;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: date != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewDate(),
                  settings: RouteSettings(
                    arguments: date,
                  ),
                ),
              );
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: date != null ? Colors.black12 : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                  '${date != null ? date!.day : ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  // (⁄) - символ дроби
                  temperatureMin != null || temperatureMax != null
                      ? '${temperatureMin ?? ''}/${temperatureMax ?? ''}'
                      : '',
                  style: const TextStyle(
                    fontSize: 12,
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
