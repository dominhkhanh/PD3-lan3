import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Notify extends StatefulWidget {
  Notify({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: list_notification == null ? 0 : list_notification.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: 15, top: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Bell_font_awesome.svg/1200px-Bell_font_awesome.svg.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  list_notification[index],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}