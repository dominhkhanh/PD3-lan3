import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:app/screens/list/list_form.dart';
import 'package:app/screens/list/details.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListSchedule createState()=> _ListSchedule();
}

class  _ListSchedule extends State<ListSchedule> {
  String qrCode = 'Unknown';
  var defaultText = TextStyle(color: Colors.black);
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
                text: list_booking[index]['subject'] + " (" + list_booking[index]['date']['date'].split(" ")[0] + " - " + list_booking[index]['time'] + ")",
                
                icon: "assets/icons/Bell.svg",
                press:() => {
                  id = list_booking[index]['id'].toString(),
                  teacher_name = list_booking[index]['teacher'].toString(),
                  subject_name = list_booking[index]['subject'].toString(),
                  class_name = list_booking[index]['class'].toString(),
                  time_name = list_booking[index]['time'].toString(),
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
        onPressed: () => scanQRCode(),
        tooltip: 'Increment',
        child: Icon(Icons.scanner),
      ), 
    );
  }

    Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", 
        "Trở về", 
        true, 
        ScanMode.QR
      );
      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
