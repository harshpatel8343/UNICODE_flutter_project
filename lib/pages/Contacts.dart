import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:main_project/pages/Contacts_info.dart';



class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  static List<Contact>? contacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getPhoneData();
  }

  void getPhoneData() async{
    if( await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Contacts'),
      ),
      body: (contacts==null)? Center(child: CircularProgressIndicator()): ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                  radius: 20,
                ),
                 title: Text(contacts![index].name.first),
                subtitle: Text(contacts![index].phones.toString()),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Contacts_info(
                    name: contacts![index].name.toString(),
                    num: contacts![index].phones.toString(),
                  )));
                 },
              ),

            );}
       ),
    );
  }
}
