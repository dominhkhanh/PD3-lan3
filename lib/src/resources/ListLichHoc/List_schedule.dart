import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListSchedule createState()=> _ListSchedule();
}

class  _ListSchedule extends State<ListSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lịch Học"),
      ),
      body: Center(
        child: Column(
          children: [
            Designlichhoc(
              text: "Lập trình hướng đối tượng",
              icon: "assets/icons/Bell.svg",
              press:() => {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> lichhoc())
              )},
            ),
          ],
        ),
      ),

    );
  }
}

class lichhoc extends StatelessWidget{
  var defaultText = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Lịch Học'),
      ),
      body:Center(
        child: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    style: defaultText,
                    text: 'Lập trình hướng đối tượng: thứ 6 ngày 7/5/2021'
                ),
              ]
          ),
        ),
      ),
    );
  }
}
