import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_openweathermap_app/provider/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'model/Weather.dart';

class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);
  Future<Position?> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // double longitude = position.longitude;
      // double latitude = position
      //     .latitude; //print('longitude:$longitude, latitude: $latitude');
      return position;
    } catch (e) {
      print('getLocation: $e');
      print("위치 정보를 가져오지 못하였습니다.");
      return null;
    }
  }

  Future<Weather?> fetchWeatherData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position? position = await getLocation();
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': position?.latitude.toString(),
      'lon': position?.longitude.toString(),
      'appid': dotenv.env['APIKEY'],
      'units': 'metric'
    });
    print(url);

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
      print('fetchWeatherData(): $e');
      // print("openweathermap에서 데이터를 가져오지 못하였습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: FutureBuilder<Weather?>(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              try {
                return Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        snapshot.data!.backgroundImg,
                        fit: BoxFit.cover,
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${snapshot.data!.temp}°',
                            style: TextStyle(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.description,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              // Text(
                              //   '습도',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ),
                              // Text(
                              //   '풍속',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } catch (e) {
                print(e);
                return Container(
                  color: Colors.yellow,
                );
              }
            }
            return Center(child: const CircularProgressIndicator());
          }),
    );
  }
}
