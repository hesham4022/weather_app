import 'package:dio/dio.dart';
import 'package:weather_app2/Models/weather_model.dart';

class WeatherServices {
  final Dio? dio;
  final String apiKey = '975595a62ec94a97a64152641250304';
  final String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio!
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps there are an error,try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('opps there are an error,try later');
    }
  }
}
