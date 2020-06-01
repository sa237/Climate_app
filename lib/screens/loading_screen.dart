import 'dart:convert';
import 'package:flutter/material.dart';
import './location_screen.dart';
import 'package:climateapp/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    WeatherModel weathermodel =  WeatherModel();
    var weatherData = await weathermodel.getLocationWeat();
    Navigator.push(context, MaterialPageRoute(builder: (context){

      return LocationScreen(weatherData: weatherData);

    }));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

