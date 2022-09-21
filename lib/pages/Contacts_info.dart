import 'package:flutter/material.dart';

class Contacts_info extends StatefulWidget {
  final String name,num;
  const Contacts_info({Key? key, required this.name, required this.num}) : super(key: key);

  @override
  State<Contacts_info> createState() => _Contacts_infoState();
}

class _Contacts_infoState extends State<Contacts_info> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                    radius: 60,
                  child: Icon(
                      Icons.person,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
