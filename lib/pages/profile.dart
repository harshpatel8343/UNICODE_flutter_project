import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  final TextEditingController name_controller =TextEditingController();
  final TextEditingController phone_controller =TextEditingController();
 final TextEditingController mail_controller =TextEditingController();
 final TextEditingController dob_controller =TextEditingController();



  void saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('NAME', name_controller.text);
    prefs.setString('CONTACT', phone_controller.text);
    prefs.setString('MAIL', mail_controller.text);
    prefs.setString('DATE', dob_controller.text);
  }

  void readText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? NAME = prefs.getString('NAME');
    String? CONTACT = prefs.getString('CONTACT');
    String? MAIL = prefs.getString('MAIL');
    String? DATE = prefs.getString('DATE');

    if (NAME!=null && CONTACT!=null && DATE!=null && MAIL!=null){
      name_controller.text= NAME;
      phone_controller.text=CONTACT;
      dob_controller.text=DATE;
      mail_controller.text=MAIL;
    }
  }

  void deleteText() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('NAME');
    prefs.remove('CONTACT');
    prefs.remove('MAIL');
    prefs.remove('DATE');
    String? NAME = "";
    String? CONTACT = "";
    String? DATE = "";
    String? MAIL = "";
    setState(() {});
  }
void initState(){
    super.initState();
readText();
deleteText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (name_controller) {
                print("NAME: "+ name_controller);
                setState(() {});
              },
              controller: name_controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                label: Text('Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (phone_controller) {
                print("NUMBER: "+ phone_controller);
                setState(() {});
              },
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                label: Text('Contact number',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (mail_controller) {
                print("MAIL: "+ mail_controller);
                setState(() {});
              },
              controller: mail_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                label: Text('Email ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (date_controller) {
                print("DATE: "+ date_controller);
                setState(() {});
              },
              controller: dob_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                label: Text('Date of birth',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
             setState(() {
               saveText();
             });
            },
            icon: Icon(Icons.save_alt,),
            label: Text('Save details'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                deleteText();
              });
            },
            icon: Icon(Icons.delete_forever),
            label: Text('Clear data'),
          ),
        ],
      ),
    );
  }
}
