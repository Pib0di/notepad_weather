import 'package:dio/dio.dart';
import 'package:notepad_weather/network/model/historical_weather/historical_weather.dart';
import 'package:notepad_weather/network/model/weather/weather_entity.dart';
import 'package:notepad_weather/network/model/weather_current_day/weather_current_day.dart';
import 'package:retrofit/http.dart';

part 'weather.g.dart';

@RestApi(baseUrl: 'https://api.open-meteo.com/v1/')
abstract class Weather {
  factory Weather(Dio dio, {String baseUrl}) = _Weather;

  @GET('/forecast')
  Future<WeatherCurrentDay> getWeatherCurrentDay(
    @Query('latitude') int? latitude,
    @Query('longitude') int? longitude,
    @Query('hourly') String? hourly,
    @Query('models') String models,
    @Query('forecast_days') int forecastDays,
  );

  @GET('/forecast')
  Future<WeatherEntity> getWeatherWeek(
    @Query('latitude') int? latitude,
    @Query('longitude') int? longitude,
    @Query('hourly') String? hourly,
    @Query('daily') String? daily,
    @Query('models') String models,
  );

  @GET('/forecast')
  Future<HistoricalWeather> getHistoricalWeather(
    @Query('latitude') int? latitude,
    @Query('longitude') int? longitude,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('daily') String daily,
  );
}
