import 'package:location/location.dart';

class LocationInfo {
  double longitude = 0;
  double latitude = 0;

  Future<void> getUserLocationData() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    longitude = _locationData.longitude!;
    latitude = _locationData.latitude!;
  }

  Future<bool> getUserLocationAndGPS() async {
    bool permission1 = await Location().requestService();
    bool permission2 = false;
    PermissionStatus permission = await Location().requestPermission();
    if (permission == PermissionStatus.granted) permission2 = true;
    return permission1 && permission2;
  }
}
