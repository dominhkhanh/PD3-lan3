import 'package:flutter/material.dart';

class nav_bottom extends StatefulWidget {
  nav_bottom({Key key}) : super(key: key);
  @override
  _nav_bottomState createState() => _nav_bottomState();
}

class _nav_bottomState extends State<nav_bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang Chủ"),
      ),
    );
  }
}
