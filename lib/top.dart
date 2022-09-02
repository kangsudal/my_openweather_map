
import 'package:flutter/material.dart';

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
              'images/Cloud.jpg',
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
                  '128°',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '비없음',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '습도',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '풍속',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
