import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class weatherData extends StatefulWidget {
  final String location;
  const weatherData({required this.location, Key? key}) : super(key: key);

  @override
  State<weatherData> createState() => _weatherDataState();
}

class _weatherDataState extends State<weatherData> {
  dynamic temp;
  dynamic hum;
  dynamic wind;
  dynamic pres;
  dynamic vis;
  dynamic location;

  Future getData() async{
    http.Response response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=${widget.location}&appid=c12a7658a5b995dd24db6b669058a22f&&units=metric'));
    var data = jsonDecode(response.body);
    setState(() {
      temp = data['main']['temp'].toString();
      hum = data['main']['humidity'].toString();
      wind = data['wind']['speed'].toString();
      pres = data['main']['pressure'].toString();
      vis = data['visibility'].toString();
      location = data['name'].toString();
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        toolbarHeight: 25,
      ),
      body: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.sunny,
                    size: 60,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(height: 30),
                  Text((temp!=null)? temp + "\u00B0C": "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight:FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10),
                  Text((location!=null)? location : "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                    ),
                  )
                ],
              ),
              height: 300,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thermostat,color: Colors.orangeAccent,
                    size: 40,
                  ),
                ],
              ),
              title: Text('Humidity',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Text((hum!=null)? hum + " %": "Loading",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_red_eye,color: Colors.orangeAccent,
                    size: 40,
                  ),
                ],
              ),
              title: Text('Visibility',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Text((vis!=null)? vis + " m": "Loading",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.waves_outlined,color: Colors.orangeAccent,
                    size: 40,
                  ),
                ],
              ),
              title: Text('Wind',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Text((wind!=null)? wind + " km/hr": "Loading",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_cloudy_outlined,color: Colors.orangeAccent,
                    size: 40,
                  ),
                ],
              ),
              title: Text('Pressure',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Text((pres!=null)? pres + " Pa": "Loading",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

    );
  }
}







