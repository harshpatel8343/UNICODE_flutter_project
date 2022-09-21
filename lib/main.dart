import 'package:flutter/material.dart';
import 'package:main_project/pages/welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0,0),
                child: Text('Get',
                style: TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black,
                 ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0,5),
                child: Text('Started!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 15),
              FloatingActionButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                 builder: (context)=>Welcome()),
                );
              },
              backgroundColor: Colors.blueGrey,
                child: Icon(Icons.arrow_forward_ios),

              ),
            ],

          ),
        ],
      ),
    );


  }
}


void main() => runApp(MaterialApp(
home: Home(),

));



