import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';
import 'package:notepad_weather/network/model/historical_weather/historical_weather.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static Dio dio = Dio();
  static Weather weather = Weather(dio);

  HomePageBloc() : super(HomePageInitial()) {
    // print('HELLLLO');
    final historicalWeather = getHistoricalWeather();
    print(historicalWeather);

    on<HomePageEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<Increment>((event, emit) {
      emit(HomePageUpdate(++state.i));
    });
  }

  Future<HistoricalWeather> getHistoricalWeather() {
    return weather.getHistoricalWeather(
      12,
      12,
      '2022-01-01',
      '2022-12-31',
      'apparent_temperature_max,apparent_temperature_min',
    );
  }
}
