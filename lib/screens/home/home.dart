import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/screens/list/ListSchedule.dart';
import 'package:app/screens/view_score/view_score.dart';
import 'package:app/screens/notification/notification.dart';
import 'package:app/screens/profile/profile.dart';
import 'package:app/screens/navigation/nav_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key, this.title}) : super(key: key);

  @override
  // final String title;
  final String title;
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectIndex = 0;
  final List<Widget> _chilerend = [NavigationBottom(), Notify(), Profile()];
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang Chủ"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.lightBlue[10],
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 30, 0, 0),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: RaisedButton(
                      color: Colors.red[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      onPressed: onClick_ListSchedule,
                      child: Text("Lịch Học",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 30, 0, 0),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: RaisedButton(
                      color: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      onPressed: onClick_ViewScore,
                      child: Text("Xem Điểm",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem NavItem(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(title));
  }

  void onClick_ListSchedule() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListSchedule()),
    );
  }

  void onClick_ViewScore() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewScore()),
    );
  }
}
