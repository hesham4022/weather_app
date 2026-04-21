class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final double temp;
  final double Maxtemp;
  final double Mintemp;
  final String weatherStatus;
  WeatherModel(
      {required this.cityName,
      required this.Maxtemp,
      required this.Mintemp,
      required this.date,
      required this.image,
      required this.temp,
      required this.weatherStatus});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      Maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      Mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      date: json['current']['last_updated'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
