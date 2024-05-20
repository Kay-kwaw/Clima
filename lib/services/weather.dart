import 'package:clima/services/location.dart';  
import 'package:clima/services/networking.dart'; 

// Constants for the OpenWeatherMap API
const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Method to get weather data for a specific city/country
  /*getCityWeather: This method takes a city name as an argument, 
  constructs the API request URL, and fetches the weather data for that city.
  */
  Future<dynamic> getCityWeather(String cityName) async {
    // Create a NetworkHelper instance with the API URL for the city
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    // Fetch the weather data
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Method to get weather data for the current location
  Future<dynamic> getLocationWeather() async {
    /*  getLocationWeather: This method gets the current geographical location,
     constructs the API request URL with the latitude and longitude, and fetches the weather data for that location.*/
    // Create a Location instance and get the current location
    Location location = Location();
    await location.getCurrentLocation();

    // Create a NetworkHelper instance with the API URL for the current location
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    // Fetch the weather data
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Method to get the appropriate weather icon based on the weather condition code
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

  // Method to get a message based on the temperature
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
