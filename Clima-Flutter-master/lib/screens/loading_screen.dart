import 'package:flutter/material.dart';

import '../services/location.dart';

var location = Location();
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {

  void getlocation() async{
    await location.getCurrentLocation();
    print(location.lat);
    print(location.long);
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
