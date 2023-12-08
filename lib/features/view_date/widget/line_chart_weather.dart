import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:notepad_weather/network/model/weather_current_day/weather_current_day.dart';

class LineChartWeather extends StatelessWidget {
  LineChartWeather({super.key, required this.weatherCurrentDay});

  final WeatherCurrentDay weatherCurrentDay;

  // final spots = List.generate(24, (hour) => hour.toDouble())
  //     .map((x) => FlSpot(x, cos(x)))
  //     .toList();
  final List<Color> gradientColors = [
    Colors.deepPurple,
    Colors.yellow,
    Colors.deepPurple,
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) {
      return Container();
    }
    final style = TextStyle(
      color: const Color(0xFF656B78),
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: const Color(0xFF656B78),
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];
    List<double> temperature2mList = weatherCurrentDay.hourly!.temperature_2m!;

    for (int x = 0; x < temperature2mList.length; ++x) {
      spots.add(FlSpot(x.toDouble(), temperature2mList[x]));
    }

    double maxY = temperature2mList
            .reduce((value, element) => value > element ? value : element) +
        1;
    double minY = temperature2mList
            .reduce((value, element) => value > element ? element : value) -
        1;

    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        bottom: 12,
        right: 12,
        top: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1B2339),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
            right: 20,
            top: 20,
          ),
          child: SizedBox(
            // width: 100,
            height: 130,
            // aspectRatio: 2.5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        maxContentWidth: 100,
                        tooltipBgColor: Colors.black,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((LineBarSpot touchedSpot) {
                            final textStyle = TextStyle(
                              color: touchedSpot.bar.gradient?.colors[0] ??
                                  touchedSpot.bar.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            );
                            return LineTooltipItem(
                              '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                              textStyle,
                            );
                          }).toList();
                        },
                      ),
                      handleBuiltInTouches: true,
                      getTouchLineStart: (data, index) => 0,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        color: Colors.deepPurpleAccent,
                        spots: spots,
                        isCurved: true,
                        isStrokeCapRound: true,
                        barWidth: 6,
                        belowBarData: BarAreaData(
                          show: false,
                        ),
                        dotData: const FlDotData(show: false),
                        gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.9))
                              .toList(),
                        ),
                      ),
                    ],
                    minY: minY.round().toDouble(),
                    maxY: maxY.round().toDouble(),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => leftTitleWidgets(
                              value, meta, constraints.maxWidth),
                          reservedSize: 56,
                          interval:
                              (((maxY - minY) - ((maxY - minY) / 2).round()) /
                                      2)
                                  .round()
                                  .toDouble(),
                        ),
                        drawBelowEverything: true,
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => bottomTitleWidgets(
                              value, meta, constraints.maxWidth),
                          reservedSize: 36,
                          interval: 4,
                        ),
                        drawBelowEverything: true,
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: true,
                      horizontalInterval: 1.5,
                      verticalInterval: 5,
                      checkToShowHorizontalLine: (value) {
                        return value.toInt() == 0;
                      },
                      getDrawingHorizontalLine: (_) => FlLine(
                        color: Colors.blue.withOpacity(1),
                        dashArray: [8, 2],
                        strokeWidth: 0.8,
                      ),
                      getDrawingVerticalLine: (_) => FlLine(
                        color: Colors.yellow.withOpacity(1),
                        dashArray: [8, 2],
                        strokeWidth: 0.8,
                      ),
                      checkToShowVerticalLine: (value) {
                        return value.toInt() == 0;
                      },
                    ),
                    borderData: FlBorderData(show: false),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
