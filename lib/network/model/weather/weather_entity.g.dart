// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherEntity()
      ..latitude = (json['latitude'] as num).toDouble()
      ..longitude = (json['longitude'] as num).toDouble()
      ..generationtimeMs = (json['generationtime_ms'] as num).toDouble()
      ..utcOffsetSeconds = (json['utc_offset_seconds'] as num).toDouble()
      ..timezone = json['timezone'] as String
      ..timezoneAbbreviation = json['timezone_abbreviation'] as String
      ..elevation = (json['elevation'] as num).toDouble()
      ..hourlyUnits = WeatherHourlyUnits.fromJson(
          json['hourly_units'] as Map<String, dynamic>)
      ..hourly = WeatherHourly.fromJson(json['hourly'] as Map<String, dynamic>)
      ..dailyUnits = WeatherDailyUnits.fromJson(
          json['daily_units'] as Map<String, dynamic>)
      ..daily = WeatherDaily.fromJson(json['daily'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
      'daily_units': instance.dailyUnits,
      'daily': instance.daily,
    };

WeatherHourlyUnits _$WeatherHourlyUnitsFromJson(Map<String, dynamic> json) =>
    WeatherHourlyUnits()
      ..time = json['time'] as String
      ..temperature2m = json['temperature_2m'] as String
      ..cloudCoverHigh = json['cloud_cover_high'] as String;

Map<String, dynamic> _$WeatherHourlyUnitsToJson(WeatherHourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'cloud_cover_high': instance.cloudCoverHigh,
    };

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) =>
    WeatherHourly()
      ..time = (json['time'] as List<dynamic>).map((e) => e as String).toList()
      ..temperature2m = (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList()
      ..cloudCoverHigh = (json['cloud_cover_high'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'cloud_cover_high': instance.cloudCoverHigh,
    };

WeatherDailyUnits _$WeatherDailyUnitsFromJson(Map<String, dynamic> json) =>
    WeatherDailyUnits()
      ..time = json['time'] as String
      ..apparentTemperatureMax = json['apparent_temperature_max'] as String
      ..apparentTemperatureMin = json['apparent_temperature_min'] as String;

Map<String, dynamic> _$WeatherDailyUnitsToJson(WeatherDailyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) => WeatherDaily()
  ..time = (json['time'] as List<dynamic>).map((e) => e as String).toList()
  ..apparentTemperatureMax = (json['apparent_temperature_max'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList()
  ..apparentTemperatureMin = (json['apparent_temperature_min'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList();

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };
