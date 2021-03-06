import 'package:flutter/material.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/notification/notification.dart';
import 'package:app/screens/profile/profile.dart';
import 'package:app/screens/list/ListSchedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationBottom extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: MyNavigationBar (),  
    );  
  }  
}  
  
class MyNavigationBar extends StatefulWidget {  
  MyNavigationBar ({Key key, this.title }) : super(key: key);  
  
  @override  
  // final String title;
  final String title;
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectIndex = 0;  
  // static const List<Widget> _widgetOptions = <Widget>[  
     
  // ];  
  final List<Widget> _chilerend= [Home(), Notify(), ListSchedule(),Profile()];
  
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
          
          NavItem(Icons.home,'Trang Chủ'),
          NavItem(Icons.notifications,'Thông báo'),
          NavItem(Icons.calendar_view_day_sharp,'Lịch Học'),
          NavItem(Icons.person, 'Thông Tin'),

        ],
        selectedItemColor: Colors.black,

        onTap: _onItemTapped,
        unselectedItemColor: Colors.white,
        currentIndex: _selectIndex,
      ),
    );  
  }  

  BottomNavigationBarItem NavItem(IconData icon, String title){
    return BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(icon),
      title: Text(title)
    );
  }
}  



