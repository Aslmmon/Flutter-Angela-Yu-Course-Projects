import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';

var location = Location();
const api_key = "01ed0bf33f0d52e1bad309739903a79b";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getlocation() async {
    await location.getCurrentLocation();

    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$api_key&units="metric"';

    NetworkingHelper networkingHelper = NetworkingHelper(url: url);
    var weatherData = await networkingHelper.getData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
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
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
