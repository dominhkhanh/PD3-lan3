import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  Notify({Key key}) : super(key: key);
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List list_notification;
  String id, class_id; 
  Future getList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      class_id = preferences.getString("class_id");
    });
    Uri myUri = Uri.parse("http://10.0.3.2:8080/db_flutter/controllers/getNotification.php");
    var response = await http.post(myUri, body: {
      "student_id": id
    });
    print(json.decode(response.body));
  }
  @override
  void initState() { 
    super.initState();
    this.getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Báo"),
      ),
    );
  }
}
