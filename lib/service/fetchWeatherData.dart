import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_openweathermap_app/model/Weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Weather?> fetchCurrentWeatherData() async {
  //현재 위치를 가져온다.
  Position? position = await getLocation();
  var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
    'lat': position?.latitude.toString(),
    'lon': position?.longitude.toString(),
    'appid': dotenv.env['APIKEY'],
    'units': 'metric'
  });
  // print(url);

  //현재 날씨 정보를 가져온다.
  try {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    print('fetchCurrentWeatherData(): $e');
    // print("openweathermap에서 데이터를 가져오지 못하였습니다.");
  }
}

Future<List<Forecast>?> fetchForecastData() async {
  //현재 위치를 가져온다.
  Position? position = await getLocation();
  var url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
    'lat': position?.latitude.toString(),
    'lon': position?.longitude.toString(),
    'appid': dotenv.env['APIKEY'],
    'units': 'metric'
  });
  print('forecast:$url');
  try {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<Forecast> forecastArray=[];
      for(int idx=0; idx<5;idx++){
        forecastArray.add(Forecast.fromJson(jsonData,idx));
      }
      print(forecastArray);
      return forecastArray;
    } else {
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    print('fetchForecastData(): $e');
    // print("openweathermap에서 데이터를 가져오지 못하였습니다.");
  }
}

Future<Position?> getLocation() async {
  //현재 위치 가져오기
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    double longitude = position.longitude;
    double latitude = position
        .latitude;
    print('longitude:$longitude, latitude: $latitude');
    return position;
  } catch (e) {
    print('getLocation: $e');
    print("위치 정보를 가져오지 못하였습니다.");
    return null;
  }
}
