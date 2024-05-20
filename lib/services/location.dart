
//The Location class uses the geolocator package to get the current geographical location (latitude and longitude) of the device
import 'package:geolocator/geolocator.dart';

class Location {
  // Variables to store the latitude and longitude of the device/user
  late double latitude;
  late double longitude;
  //the late keyboards indicate that the variables will be initialized later in the code.

  // Method to get the current location of the device/user
  Future<void> getCurrentLocation() async {
    // Requesting the current position with low accuracy
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // Storing the latitude and longitude in the instance variables
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}