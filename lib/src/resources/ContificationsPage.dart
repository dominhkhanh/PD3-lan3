import 'package:flutter/material.dart';  


class ContificationsPage extends StatefulWidget {
  ContificationsPage({Key key }) : super (key: key);
  @override
  _ContificationsPageState createState()=> _ContificationsPageState();

}
  

class  _ContificationsPageState extends State<ContificationsPage> {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ContificationsPage"), 
      ),
      
    );
    
    }
}


