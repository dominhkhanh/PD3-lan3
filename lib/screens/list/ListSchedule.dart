import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:app/screens/list/details.dart';

class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListSchedule createState()=> _ListSchedule();
}

class  _ListSchedule extends State<ListSchedule> {
  int id;
  String teacher_name, subject_name, class_name, contents, link, time_name, date;
  List list_booking;
  String student_id, class_id;
  Future<List> GetListBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      student_id = preferences.getString("student_id");
      class_id = preferences.getString("class_id");
    });
    Uri myUri = Uri.parse("http://10.0.3.2:8080/db_flutter/controllers/get_booking_by_stu_id.php");
    var response = await http.post(
      myUri, 
      body: { "student_id": student_id, "class_id": class_id }
    );
    this.setState(() {
      list_booking = json.decode(response.body);
    });
    return list_booking;
  }

  @override
  void initState() { 
    super.initState();
    GetListBooking();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Lịch Học Online"),
          ),
          body: _buildListView(context),
        )
    );
  }
  ListView _buildListView(BuildContext buildContext){
    return ListView.builder(
        itemCount: list_booking == null ? 0 : list_booking.length,
        itemBuilder: (_, index){
          return ListTile(
            title: Text(list_booking[index]['subject_name'] + " - " + list_booking[index]['class_name']),
            leading: Icon(Icons.book),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              id = list_booking[index]['id'];
              subject_name = list_booking[index]['subject_name'];
              class_name = list_booking[index]['class_name'];
              contents = list_booking[index]['content'];
              link = list_booking[index]['linkstream'];
              date = list_booking[index]['date'];
              var route = new MaterialPageRoute(
                builder: (BuildContext content) => new Detail(id, subject_name, class_name, contents, link, date));
              Navigator.of(context).push(route);
            },
          );
        },
    );
  }
}
