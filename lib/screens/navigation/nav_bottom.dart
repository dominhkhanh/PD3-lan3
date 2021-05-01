import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  NavigationBottom({Key key}) : super(key: key);
  @override
  _NavigationBottomState createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang Chủ"),
      ),
    );
  }
}
