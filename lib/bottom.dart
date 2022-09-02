
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Today Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '동, 구',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              //Time & Icon & celcius data Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //One cell widget
                  CellWidget(
                    date: 'Now',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '10시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '11시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '12시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '13시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                ],
              ),
            ],
          ),
        ),
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
  IconData icon;
  String celcious;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FittedBox(
            child: Text(date),
            fit: BoxFit.scaleDown,
          ),
          FittedBox(
            child: Icon(icon),
            fit: BoxFit.scaleDown,
          ),
          FittedBox(
            child: Text('$celcious°'),
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
