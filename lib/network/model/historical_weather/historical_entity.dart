import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'historical_entity.g.dart';

@JsonSerializable()
class HistoricalEntity {
  late double latitude;
  late double longitude;
  @JsonKey(name: "generationtime_ms")
  late double generationtimeMs;
  @JsonKey(name: "utc_offset_seconds")
  late int utcOffsetSeconds;
  late String timezone;
  @JsonKey(name: "timezone_abbreviation")
  late String timezoneAbbreviation;
  late double elevation;
  @JsonKey(name: "daily_units")
  late HistoricalDailyUnits dailyUnits;
  late HistoricalDaily daily;

  HistoricalEntity();

  factory HistoricalEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoricalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoricalDailyUnits {
  late String time;
  @JsonKey(name: "apparent_temperature_max")
  late String apparentTemperatureMax;
  @JsonKey(name: "apparent_temperature_min")
  late String apparentTemperatureMin;

  HistoricalDailyUnits();

  factory HistoricalDailyUnits.fromJson(Map<String, dynamic> json) =>
      _$HistoricalDailyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalDailyUnitsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoricalDaily {
  late List<String> time;
  @JsonKey(name: "apparent_temperature_max")
  late List<double?> apparentTemperatureMax;
  @JsonKey(name: "apparent_temperature_min")
  late List<double?> apparentTemperatureMin;

  HistoricalDaily();

  factory HistoricalDaily.fromJson(Map<String, dynamic> json) =>
      _$HistoricalDailyFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalDailyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
