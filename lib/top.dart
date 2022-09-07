

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_openweathermap_app/provider/weather_provider.dart';
import 'package:my_openweathermap_app/service/fetchWeatherData.dart';
import 'package:provider/provider.dart';


import 'model/Weather.dart';

class Top extends StatefulWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {

@override
  void initState() {
  fetchForecastData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: FutureBuilder<Weather?>(
          future: fetchCurrentWeatherData(),
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
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                // Shadow(
                                //   offset: Offset(10.0, 10.0),
                                //   blurRadius: 8.0,
                                //   color: Color.fromARGB(125, 0, 0, 255),
                                // ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
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
                              IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
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
                  child: Text("데이터를 가져오지 못하였습니다."),
                );
              }
            }else{
              return Center(child: const CircularProgressIndicator());
            }
          }),
    );
  }
}
