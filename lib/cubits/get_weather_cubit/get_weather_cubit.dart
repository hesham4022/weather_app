import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/Models/weather_model.dart';
import 'package:weather_app2/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app2/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getCurrentWeather({required String CityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: CityName);
      emit(WeatherLaodedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
