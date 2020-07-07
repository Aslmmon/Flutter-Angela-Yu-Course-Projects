import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';



var location = Location();
const api_key = "01ed0bf33f0d52e1bad309739903a79b";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;


  void getlocation() async {
    await location.getCurrentLocation();
    latitude = location.lat;
    longitude = location.long;
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key';

    NetworkingHelper networkingHelper = NetworkingHelper(url:url);
    var weatherData = await networkingHelper.getData();
    print(weatherData);
  }



  @override
  void initState() {
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //  getCurrentLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
