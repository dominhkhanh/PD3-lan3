import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:app/screens/list/list_form.dart';
import 'package:app/screens/list/details.dart';
import 'package:app/models/Booking.dart';
import 'package:app/screens/list/event_detail.dart';

class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListScheduleState createState()=> _ListScheduleState();
}

class  _ListScheduleState extends State<ListSchedule> {
  List<dynamic> list_booking;
  String student_id, class_id;
  String qrCode = 'Unknown';
  // String id, teacher_name, subject_name, class_name, contents, link, time_name, date, qrcode;

  var defaultText = TextStyle(color: Colors.black);

  Future<List> getListBooking() async {
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
    getListBooking();
  }

  @override
  Widget build(BuildContext context) {
    // Let's get two dates :
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lịch Học"), 
      ),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 1,
        dataSource: MeetingDataSource(getAppointments(list_booking)),
        onTap: (CalendarTapDetails details) {
          DateTime date = details.date;
          Appointment appointments = details.appointments[0];
          CalendarElement view = details.targetElement;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => 
              Detail(
                id: appointments.resourceIds[0],
                teacher_name: appointments.resourceIds[1],
                subject_name: appointments.subject,
                class_name: appointments.resourceIds[2],
                phone: appointments.resourceIds[3],
                email: appointments.resourceIds[4],
                link: appointments.resourceIds[5],
                contents: appointments.resourceIds[6],
                date: appointments.startTime.toString().split(" ")[0],
                time_name: appointments.resourceIds[7],
                qrcode: appointments.resourceIds[8],
              )
            ),
          );
        },
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

List<Appointment> getAppointments(List booking) {
  List<Appointment> meetings = <Appointment>[];
  DateTime now = DateTime.now();
  for(var i in booking) {
    DateTime date = DateTime.parse(i['date'].toString().split(" ")[1]);
    var time_start = i['time_start'].toString().split(" ")[2];
    var time_end = i['time_end'].toString().split(" ")[2];
    DateTime startTime = DateTime(date.year, date.month, date.day, int.parse(time_start.split(":")[0]), int.parse(time_start.split(":")[1]), 0);
    DateTime endTime = DateTime(date.year, date.month, date.day, int.parse(time_end.split(":")[0]), int.parse(time_end.split(":")[1]), 0);
    if(now.isAfter(date)) {
      meetings.add(Appointment(
        resourceIds: [
          i['id'], i['teacher'], i['class'], i['phone'], i['email'], i['link'], i['content'], i['time'], i['qrcode']
        ],
        startTime: startTime,
        endTime: endTime,
        subject: i['subject'],
        color: Colors.grey,
        recurrenceRule: 'FREQ=DAILY;COUNT=1',
        isAllDay: false)
      );
    }
    else if (now.isBefore(date)) {
      meetings.add(Appointment(
        resourceIds: [
          i['id'], i['teacher'], i['class'], i['phone'], i['email'], i['link'], i['content'], i['time'], i['qrcode']
        ],
        startTime: startTime,
        endTime: endTime,
        subject: i['subject'],
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;COUNT=1',
        isAllDay: false)
      );
    }
  }
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
