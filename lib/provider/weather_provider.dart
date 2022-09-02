import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherProvider with ChangeNotifier {
  //ingredient
  final apiKey = dotenv.env['APIKEY']; //openweathermap key
  double longitude = 0; //device location data
  double latitude = 0;

  //wanted data
  double temp = 0;
  double id = 800;
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
  }

  Future<void> fetchWeatherData() async {
    await getLocation();
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': apiKey
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
      } else {
        print('응답:${response.statusCode}');
      }
    } catch (e) {
      print('openweathermap에서 데이터를 가져오지 못하였습니다.');
      print(e);
    }
  }
}
