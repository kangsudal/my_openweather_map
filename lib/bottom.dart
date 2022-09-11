import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_openweathermap_app/model/Weather.dart';
import 'package:my_openweathermap_app/service/fetchWeatherData.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<Forecast>?>(
            future: fetchForecastData(),
            builder: (context, snapshot) {
              try {
                if (snapshot.hasData) {
                  DateTime dt0 = DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data![0].dt * 1000);
                  var format_dt0 = DateFormat('HH a').format(dt0);
                  DateTime dt1 = DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data![1].dt * 1000);
                  var format_dt1 = DateFormat('HH a').format(dt1);
                  DateTime dt2 = DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data![2].dt * 1000);
                  var format_dt2 = DateFormat('HH a').format(dt2);
                  DateTime dt3 = DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data![3].dt * 1000);
                  var format_dt3 = DateFormat('HH a').format(dt3);

                  return LayoutBuilder(builder: (context, constraint) {
                    var height = constraint.maxHeight;
                    var width = constraint.maxWidth;
                    print('height:$height, width:$width');
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //One cell widget
                        Container(
                          // color: Colors.yellow,
                          height: height,
                          width: width / 4,
                          child: CellWidget(
                            date: '${format_dt0}',
                            icon: Image.network(
                              snapshot.data![0].icon,
                              fit: BoxFit.scaleDown,
                            ),
                            celcious: '${snapshot.data![0].temp}',
                          ),
                        ),
                        Container(
                          // color: Colors.blueGrey,
                          height: height,
                          width: width / 4,
                          child: CellWidget(
                            date: '${format_dt1}',
                            icon: Image.network(
                              snapshot.data![1].icon,
                              fit: BoxFit.scaleDown,
                            ),
                            celcious: '${snapshot.data![1].temp}',
                          ),
                        ),
                        Container(
                          height: height,
                          width: width / 4,
                          child: CellWidget(
                            date: '${format_dt2}',
                            icon: Image.network(snapshot.data![2].icon,
                                fit: BoxFit.scaleDown),
                            celcious: '${snapshot.data![2].temp}',
                          ),
                        ),
                        Container(
                          // color: Colors.orange,
                          height: height,
                          width: width / 4,
                          child: CellWidget(
                            date: '${format_dt3}',
                            icon: Image.network(snapshot.data![3].icon,
                                fit: BoxFit.scaleDown),
                            celcious: '${snapshot.data![3].temp}',
                          ),
                        ),
                      ],
                    );
                  });
                }
              } catch (e) {
                print('bottom-FutureBuilder: $e');
                return Container(
                  child: Text('데이터를 불러오지 못했습니다.'),
                );
              }
              return Center(child: const CircularProgressIndicator());
            }),
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  CellWidget({
    Key? key,
    required this.date,
    required this.icon,
    required this.celcious,
  }) : super(key: key);
  String date;
  Image icon;
  String celcious;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(date),
        icon,
        Text('$celcious°'),
      ],
    );
  }
}
