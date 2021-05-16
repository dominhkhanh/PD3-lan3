import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:app/screens/list/list_form.dart';
import 'package:app/screens/list/details.dart';

class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListSchedule createState()=> _ListSchedule();
}

class  _ListSchedule extends State<ListSchedule> {
  // ignore: non_constant_identifier_names
  String id, teacher_name, subject_name, class_name, contents, link, time_name, date, qrcode;
  // ignore: non_constant_identifier_names
  List list_booking;
  // ignore: non_constant_identifier_names
  String student_id, class_id;
  // ignore: non_constant_identifier_names
  Future<List> GetListBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      student_id = preferences.getString("student_id");
      class_id = preferences.getString("class_id");
    });
    Uri myUri = Uri.parse("http://10.0.2.2:8080/db_flutter/controllers/get_booking_by_stu_id.php");
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lịch Học"), 
      ),
      body: Center(
        child: Column(
          children: new List.generate(
            list_booking == null ? 0 : list_booking.length,
            (index) => ListForm(
                text: list_booking[index]['subject_name'] + " (" + list_booking[index]['date']['date'].split(" ")[0] + " - " + list_booking[index]['time_name'] + ")",
                
                icon: "assets/icons/Bell.svg",
                press:() => {
                  id = list_booking[index]['id'].toString(),
                  teacher_name = list_booking[index]['teacher_name'].toString(),
                  subject_name = list_booking[index]['subject_name'].toString(),
                  class_name = list_booking[index]['class_name'].toString(),
                  time_name = list_booking[index]['time_name'].toString(),
                  contents = list_booking[index]['content'].toString(),
                  link = list_booking[index]['link'].toString(),
                  date = list_booking[index]['date']['date'].split(" ")[0].toString(),
                  qrcode = list_booking[index]['qrcode'].toString(),
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Detail(
                      teacher_name: teacher_name, subject_name: subject_name, class_name: class_name, time_name: time_name, contents: contents, link: link, date: date, qrcode: qrcode
                    )
                  )
                )},
              ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.scanner),
      ), 
    );
  }
}
