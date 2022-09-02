import 'package:flutter/material.dart';
import 'package:my_openweathermap_app/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              context.watch<WeatherProvider>().backgroundImg,
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
                  '${context.watch<WeatherProvider>().temp}°',
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
                      context.watch<WeatherProvider>().description,
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
      ),
    );
  }
}
