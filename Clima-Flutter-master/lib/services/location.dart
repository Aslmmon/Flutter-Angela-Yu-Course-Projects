import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.lat, this.long});

  double lat;
  double long;

  Future<void> getCurrentLocation() async {
    try {
    var  postion = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      lat = postion.latitude;
      long = postion.longitude;
    } catch (e) {
      print(e);
    }
  }
}
