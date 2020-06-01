import 'package:flutter/material.dart';
import 'package:climateapp/constants.dart';
import 'package:climateapp/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {



  LocationScreen({this.weatherData});


  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String city;
  WeatherModel weather = WeatherModel();
  String weatherIcon;
  String tempMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic data){
    setState(() {
      if (data == null){
        temperature = 0;
        city = '';
        weatherIcon ='ERROR';
        tempMessage = 'Unable to load location.Please check your internet connection';
        return;
      }
      double temp = data['main']['temp'];
      temperature = temp.toInt();
      city  = data['name'];
      var condition = data['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      tempMessage = weather.getMessage(temperature);


    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/569a8dbb02b52_thumb900.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: ()async{
                        await weather.getLocationWeat();
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async{
                        var newName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CityScreen();

                        },),);
                        if(newName != null){
                          var weatherData= await weather.getNewLocation(newName);
                          updateUI(weatherData);

                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$tempMessage in $city!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

