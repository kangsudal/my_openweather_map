import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherProvider with ChangeNotifier{

  //ingredient
  final apiKey = dotenv.env['APIKEY'];


  //wated data
  final int temp=0;
  final int id=800;
  final String description='';

  void getLocation(){

  }

  void fetchWeatherData(){

  }

}