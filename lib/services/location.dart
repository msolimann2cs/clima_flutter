import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService({this.latitude, this.longitude});
  double? longitude;
  double? latitude;

  Future<void> askPermission() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
