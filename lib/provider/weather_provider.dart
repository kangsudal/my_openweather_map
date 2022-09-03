import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherProvider with ChangeNotifier {
/*  //ingredient
  final apiKey = dotenv.env['APIKEY']; //openweathermap key
  double longitude = 0; //device location data
  double latitude = 0;

  //wanted data
  double temp = 0;
  double id = 800;//Weather condition codes https://openweathermap.org/weather-conditions#Icon-list
  String backgroundImg = 'images/Cloud.jpg';
  String description = '';

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position
          .latitude; //print('longitude:$longitude, latitude: $latitude');
    } catch (e) {
      print("위치 정보를 가져오지 못하였습니다.");
    }
    notifyListeners();
  }

  Future<void> fetchWeatherData() async {
    await getLocation();
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': apiKey,
      'units': 'metric'
    }); // print(url);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("temp:${jsonData['main']['temp']}");
        print("id: ${jsonData['weather'][0]['id']}");
        print("description:${jsonData['weather'][0]['description']}");
        temp = jsonData['main']['temp'];
        id = jsonData['weather'][0]['id'];
        description = jsonData['weather'][0]['description'];
        print('$temp,$id,$description');

        if(id >=00 && id<300){
          backgroundImg = 'images/Thunderstorm.jpg';
        }else if(id >=300 && id <500){
          backgroundImg = 'images/Drizzle.jpg';
        }else if(id>=500 && id<600){
          backgroundImg = 'images/Rain.jpg';
        }else if(id>=600 && id<700){
          backgroundImg = 'images/Atmosphere.jpg';
        }else if(id==800){
          backgroundImg = "images/Clear.jpg";
        }else{
          if(id ==801)
            backgroundImg = "images/Cloud.jpg";
          if(id == 802)
            backgroundImg = 'images/Cloud_scattered.jpg';
          if(id == 803)
            backgroundImg = 'images/Clound_broken.jpg';
          if(id == 804)
            backgroundImg = 'images/Cloud_overcast.jpg';
        }

      } else {
        print('응답:${response.statusCode}');
      }
    } catch (e) {
      print('openweathermap에서 데이터를 가져오지 못하였습니다.');
      print(e);
    }
    notifyListeners();
  }
  */
}
