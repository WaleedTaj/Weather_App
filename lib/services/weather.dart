import 'location.dart';
import 'networking.dart';

// Todo: remove apiKey when upload to GitHub
const apiKey = 'Your API Key';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Getting the weather data from city name
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    // metric = Degree Celsius // imperial = Fahrenheit

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Getting the weather data from latitude and longitude by current location
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    // metric = Degree Celsius // imperial = Fahrenheit

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
