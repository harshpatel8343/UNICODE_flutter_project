import 'package:flutter/material.dart';
import 'package:main_project/pages/Weather.dart';
import 'package:main_project/pages/profile.dart';
import 'package:main_project/pages/Contacts.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0,0),
                child: Text('Welcome',
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
                child: Text('back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    MaterialButton(
                      color: Colors.blueGrey,
                         splashColor: Colors.black12,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(15)
                         ),
                         onPressed: (){
                          setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return Profile();
                            }),);
                          });
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.contact_mail),
                  SizedBox(width: 10),
                  MaterialButton(
                    color: Colors.blueGrey,
                    splashColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                          return Contacts();
                        }),);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Contacts',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.sunny),
                    SizedBox(width: 12),
                    MaterialButton(
                      color: Colors.blueGrey,
                      splashColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return Weather();
                          }),);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Weather',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
       ],
      ),
    );
  }
}
