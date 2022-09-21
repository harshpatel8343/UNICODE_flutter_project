import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Weather'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Mumbai',
            style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color:Colors.black,
           ),
          )
        ],
      ),
    );
  }
}
