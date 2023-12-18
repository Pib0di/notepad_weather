import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  late double latitude;
  late double longitude;
  @JsonKey(name: 'generationtime_ms')
  late double generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  late double utcOffsetSeconds;
  late String timezone;
  @JsonKey(name: 'timezone_abbreviation')
  late String timezoneAbbreviation;
  late double elevation;
  @JsonKey(name: 'hourly_units')
  late WeatherHourlyUnits hourlyUnits;
  late WeatherHourly hourly;
  @JsonKey(name: 'daily_units')
  late WeatherDailyUnits dailyUnits;
  late WeatherDaily daily;

  WeatherEntity();

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherHourlyUnits {
  late String time;
  @JsonKey(name: 'temperature_2m')
  late String temperature2m;
  @JsonKey(name: 'cloud_cover_high')
  late String cloudCoverHigh;

  WeatherHourlyUnits();

  factory WeatherHourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourlyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherHourlyUnitsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherHourly {
  late List<String> time;
  @JsonKey(name: 'temperature_2m')
  late List<double> temperature2m;
  @JsonKey(name: 'cloud_cover_high')
  late List<double> cloudCoverHigh;

  WeatherHourly();

  factory WeatherHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherHourlyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDailyUnits {
  late String time;
  @JsonKey(name: 'apparent_temperature_max')
  late String apparentTemperatureMax;
  @JsonKey(name: 'apparent_temperature_min')
  late String apparentTemperatureMin;

  WeatherDailyUnits();

  factory WeatherDailyUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyUnitsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDaily {
  late List<String> time;
  @JsonKey(name: 'apparent_temperature_max')
  late List<double> apparentTemperatureMax;
  @JsonKey(name: 'apparent_temperature_min')
  late List<double> apparentTemperatureMin;

  WeatherDaily();

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
