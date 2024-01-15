// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentDay _$WeatherCurrentDayFromJson(Map<String, dynamic> json) =>
    WeatherCurrentDay(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      generationtime_ms: (json['generationtime_ms'] as num?)?.toDouble(),
      utc_offset_seconds: (json['utc_offset_seconds'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezone_abbreviation: json['timezone_abbreviation'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
      hourly_units: json['hourly_units'] == null
          ? null
          : HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherCurrentDayToJson(WeatherCurrentDay instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtime_ms,
      'utc_offset_seconds': instance.utc_offset_seconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezone_abbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourly_units,
      'hourly': instance.hourly,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      json['time'] as String?,
      json['temperature_2m'] as String?,
      json['cloud_cover_high'] as String?,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'cloud_cover_high': instance.cloud_cover_high,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      (json['cloud_cover_high'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'cloud_cover_high': instance.cloud_cover_high,
    };
