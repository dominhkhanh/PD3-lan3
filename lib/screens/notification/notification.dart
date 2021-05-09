import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Notify extends StatefulWidget {
  Notify({Key key }) : super (key: key);
  @override
  _NotifyState createState()=> _NotifyState();
}
  
class _NotifyState extends State<Notify> {
  List list_notification;
  String id; 
  Future<List> getNotifyList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
    Uri myUri = Uri.parse("http://10.0.3.2:8080/db_flutter/controllers/get_notification.php");
    var response = await http.post(
      myUri, 
      body: { "student_id": id }
    );
    this.setState(() {
      list_notification = json.decode(response.body);
    });
    return list_notification;
  }

  @override
  void initState() { 
    super.initState();
    getNotifyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Báo"),
      ),
      body: ListView.builder(
        itemCount: list_notification == null ? 0 : list_notification.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list_notification[index]),
            leading: Icon(Icons.notification_important_sharp),
          );
        }
      )
    );
  }
}
