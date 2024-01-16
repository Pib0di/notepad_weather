// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricalEntity _$HistoricalEntityFromJson(Map<String, dynamic> json) =>
    HistoricalEntity()
      ..latitude = (json['latitude'] as num).toDouble()
      ..longitude = (json['longitude'] as num).toDouble()
      ..generationtimeMs = (json['generationtime_ms'] as num).toDouble()
      ..utcOffsetSeconds = json['utc_offset_seconds'] as int
      ..timezone = json['timezone'] as String
      ..timezoneAbbreviation = json['timezone_abbreviation'] as String
      ..elevation = (json['elevation'] as num).toDouble()
      ..dailyUnits = HistoricalDailyUnits.fromJson(
          json['daily_units'] as Map<String, dynamic>)
      ..daily = HistoricalDaily.fromJson(json['daily'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoricalEntityToJson(HistoricalEntity instance) =>
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

HistoricalDailyUnits _$HistoricalDailyUnitsFromJson(
        Map<String, dynamic> json) =>
    HistoricalDailyUnits()
      ..time = json['time'] as String
      ..apparentTemperatureMax = json['apparent_temperature_max'] as String
      ..apparentTemperatureMin = json['apparent_temperature_min'] as String;

Map<String, dynamic> _$HistoricalDailyUnitsToJson(
        HistoricalDailyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };

HistoricalDaily _$HistoricalDailyFromJson(Map<String, dynamic> json) =>
    HistoricalDaily()
      ..time = (json['time'] as List<dynamic>).map((e) => e as String).toList()
      ..apparentTemperatureMax =
          (json['apparent_temperature_max'] as List<dynamic>)
              .map((e) => (e as num?)?.toDouble())
              .toList()
      ..apparentTemperatureMin =
          (json['apparent_temperature_min'] as List<dynamic>)
              .map((e) => (e as num?)?.toDouble())
              .toList();

Map<String, dynamic> _$HistoricalDailyToJson(HistoricalDaily instance) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
    };
