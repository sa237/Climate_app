import 'package:climateapp/services/networking.dart';
import 'package:climateapp/services/location.dart';


const apiKey = '58f8d02b9a37f10faebecd6aa44528f3';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {


  Future<dynamic> getNewLocation(String city) async{
    Networking networkHelp = Networking(url: '$openWeatherMapURL?q=$city&appid=$apiKey&units=metric');
    var weatherData = await networkHelp.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeat() async{
    Location loc = Location();
    await loc.getCurrentLocation();


    Networking networkHelp = Networking(url:
    '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelp.getData();

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
