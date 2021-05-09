import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget{
  int id;
  String teacher_name, subject_name, class_name, content, link, time_name, date;

  Detail(this.id, this.subject_name, this.class_name, this.content, this.link, this.date);
  
  @override
  _DetailState createState() => new _DetailState();
}
class _DetailState extends State<Detail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Lịch Học'),
      ),
      body: new Text(widget.class_name), 
    );
  }
}
