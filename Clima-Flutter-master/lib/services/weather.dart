import 'package:clima/services/location.dart';

import 'networking.dart';

class WeatherModel {

  static const openWatehrUrl = "https://api.openweathermap.org/data/2.5/weather";
  final api_key = "01ed0bf33f0d52e1bad309739903a79b";


  Future<dynamic> getWeatherData() async {
    var location = Location();
    await location.getCurrentLocation();
    var url = '$openWatehrUrl?lat=${location.lat}&lon=${location.long}&appid=$api_key&units="metric"';

    NetworkingHelper networkingHelper = NetworkingHelper(url: url);
    var weatherData = await networkingHelper.getData();
    print(weatherData);
    return weatherData;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
