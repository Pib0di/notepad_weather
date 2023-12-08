import 'package:dio/dio.dart';
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
}
