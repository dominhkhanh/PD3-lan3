import 'package:flutter/material.dart';

class notification_page extends StatefulWidget {
  notification_page({Key key}) : super(key: key);
  @override
  _notification_pageState createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Báo"),
      ),
    );
  }
}
