import 'package:json_annotation/json_annotation.dart';

part 'weather_current_day.g.dart';

@JsonSerializable()
class WeatherCurrentDay {
  const WeatherCurrentDay({
    this.latitude,
    this.longitude,
    this.generationtime_ms,
    this.utc_offset_seconds,
    this.timezone,
    this.timezone_abbreviation,
    this.elevation,
    this.hourly_units,
    this.hourly,
  });
  factory WeatherCurrentDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentDayFromJson(json);
  final double? latitude;
  final double? longitude;
  final double? generationtime_ms;
  final double? utc_offset_seconds;
  final String? timezone;
  final String? timezone_abbreviation;
  final double? elevation;
  final HourlyUnits? hourly_units;
  final Hourly? hourly;
  Map<String, dynamic> toJson() => _$WeatherCurrentDayToJson(this);
}

@JsonSerializable()
class HourlyUnits {
  const HourlyUnits(
    this.time,
    this.temperature_2m,
    this.cloud_cover_high,
  );

  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);

  final String? time;
  final String? temperature_2m;
  final String? cloud_cover_high;

  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}

@JsonSerializable()
class Hourly {
  const Hourly(
    this.time,
    this.temperature_2m,
    this.cloud_cover_high,
  );

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  final List<String>? time;
  final List<double>? temperature_2m;
  final List<double>? cloud_cover_high;

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
