import 'package:flutter/material.dart';
import 'package:main_project/pages/weather_data.dart';

void main()=>runApp(const MaterialApp(
  home: Weather(),
));

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final TextEditingController textController = TextEditingController();
  String location= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (location_controller) {
                  print("Location: "+ location_controller);
                  setState(() {});
                },
                controller: textController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  label: Text('CITY',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.pin_drop,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
           Padding(
             padding: const EdgeInsets.fromLTRB(0,0,25,0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 FloatingActionButton(
                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>weatherData(
                          location: textController.text)
                        ));
                        },
                   backgroundColor: Colors.blueGrey,
                   child: Icon(Icons.arrow_forward_ios),
                 ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}
