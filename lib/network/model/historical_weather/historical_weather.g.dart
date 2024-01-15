// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricalWeather _$HistoricalWeatherFromJson(Map<String, dynamic> json) =>
    HistoricalWeather()
      ..latitude = (json['latitude'] as num).toDouble()
      ..longitude = (json['longitude'] as num).toDouble()
      ..generationtimeMs = (json['generationtime_ms'] as num).toDouble()
      ..utcOffsetSeconds = json['utc_offset_seconds'] as int
      ..timezone = json['timezone'] as String
      ..timezoneAbbreviation = json['timezone_abbreviation'] as String
      ..elevation = (json['elevation'] as num).toDouble()
      ..dailyUnits = HistoricalWeatherDailyUnits.fromJson(
          json['daily_units'] as Map<String, dynamic>,)
      ..daily = HistoricalWeatherDaily.fromJson(
          json['daily'] as Map<String, dynamic>,);

Map<String, dynamic> _$HistoricalWeatherToJson(HistoricalWeather instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'daily_units': instance.dailyUnits,
      'daily': instance.daily,
    };

HistoricalWeatherDailyUnits _$HistoricalWeatherDailyUnitsFromJson(
        Map<String, dynamic> json,) =>
    HistoricalWeatherDailyUnits()
      ..time = json['time'] as String
      ..apparentTemperatureMax = json['apparent_temperature_max'] as String
      ..apparentTemperatureMin = json['apparent_temperature_min'] as String;

Map<String, dynamic> _$HistoricalWeatherDailyUnitsToJson(
        HistoricalWeatherDailyUnits instance,) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };

HistoricalWeatherDaily _$HistoricalWeatherDailyFromJson(
        Map<String, dynamic> json,) =>
    HistoricalWeatherDaily()
      ..time = (json['time'] as List<dynamic>).map((e) => e as String).toList()
      ..apparentTemperatureMax =
          (json['apparent_temperature_max'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList()
      ..apparentTemperatureMin =
          (json['apparent_temperature_min'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList();

Map<String, dynamic> _$HistoricalWeatherDailyToJson(
        HistoricalWeatherDaily instance,) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };
