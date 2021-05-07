


import 'package:App/src/resources/ListLichHoc/List_schedule.dart';
import 'package:flutter/material.dart';
import '../tailieu/ContificationsPage.dart';
import '../Profile/Profilemain.dart';
import 'homepage2.dart';
 
class HomePage extends StatelessWidget {  
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
  final List<Widget> _chilerend= [homepage2(), ContificationsPage(), ListSchedule(),Profilemain()];
  
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
          NavItem(Icons.book,'Tài Liệu'),
          NavItem(Icons.list_sharp,'Lịch Học'),
          NavItem(Icons.save, 'Thông Tin'),

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


  // void onlichClicked(){
      
  // }
}  



