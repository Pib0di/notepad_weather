import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'historical_weather.g.dart';

@JsonSerializable()
class HistoricalWeather {
  late double latitude;
  late double longitude;
  @JsonKey(name: 'generationtime_ms')
  late double generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  late int utcOffsetSeconds;
  late String timezone;
  @JsonKey(name: 'timezone_abbreviation')
  late String timezoneAbbreviation;
  late double elevation;
  @JsonKey(name: 'daily_units')
  late HistoricalWeatherDailyUnits dailyUnits;
  late HistoricalWeatherDaily daily;

  HistoricalWeather();

  factory HistoricalWeather.fromJson(Map<String, dynamic> json) =>
      _$HistoricalWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoricalWeatherDailyUnits {
  late String time;
  @JsonKey(name: 'apparent_temperature_max')
  late String apparentTemperatureMax;
  @JsonKey(name: 'apparent_temperature_min')
  late String apparentTemperatureMin;

  HistoricalWeatherDailyUnits();

  factory HistoricalWeatherDailyUnits.fromJson(Map<String, dynamic> json) =>
      _$HistoricalWeatherDailyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalWeatherDailyUnitsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoricalWeatherDaily {
  late List<String> time;
  @JsonKey(name: 'apparent_temperature_max')
  late List<double> apparentTemperatureMax;
  @JsonKey(name: 'apparent_temperature_min')
  late List<double> apparentTemperatureMin;

  HistoricalWeatherDaily();

  factory HistoricalWeatherDaily.fromJson(Map<String, dynamic> json) =>
      _$HistoricalWeatherDailyFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalWeatherDailyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
