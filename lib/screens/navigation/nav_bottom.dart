import 'package:flutter/material.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/notification/notification.dart';
import 'package:app/screens/profile/profile.dart';

class NavigationBottom extends StatelessWidget {
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
  // static const List<Widget> _widgetOptions = <Widget>[

  // ];
  final List<Widget> _chilerend = [Home(), Notify(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chilerend[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          NavItem(Icons.home, 'Trang Chủ'),
          NavItem(Icons.notifications, 'Thông Báo'),
          NavItem(Icons.save, 'Cá Nhân'),
        ],
        selectedItemColor: Colors.black,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectIndex,
      ),
    );
  }

  BottomNavigationBarItem NavItem(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(title));
  }
}
