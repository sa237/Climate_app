import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'BalsamiqSans',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'BalsamiqSans',
  fontSize: 60.0,

);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'BalsamiqSans',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecorationScreen = InputDecoration(

  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name Here',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ) ,


);
