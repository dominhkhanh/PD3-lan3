import 'package:flutter/material.dart';

class BookingModel {
  final String id;
  final String teacher;
  final String phone;
  final String email;
  final String subject;
  final String content;
  final String link;
  final String classes;
  final String date;
  final String time;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
  final String qrcode;
  final String recurrenceRule;
  final bool isAllDay;
  final Color color;

  BookingModel({
    this.id,
    this.teacher,
    this.phone,
    this.email,
    this.subject,
    this.content,
    this.link,
    this.classes,
    this.date,
    this.time,
    this.startTime,
    this.endTime,
    this.status,
    this.qrcode,
    this.recurrenceRule,
    this.isAllDay,
    this.color
  });

  // factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
  //   id: json['id'],
  //   teacher: json['teacher'],
  //   phone: json['phone'],
  //   email: json['email'],
  //   subject: json['subject'],
  //   content: json['content'],
  //   link: json['link'],
  //   classes: json['class'],
  //   date: json['date'],
  //   time: json['time'],
  //   startTime: json['time_start'],
  //   endTime: json['time_end'],
  //   status: json['status'],
  //   qrcode: json['qrcode']
  // );

  // Map<String, dynamic> toJson() => {
  //   'id': id, 
  //   'teacher': teacher,
  //   'phone': phone,
  //   'email': email,
  //   'subject': subject,
  //   'content': content,
  //   'link': link,
  //   'class': classes,
  //   'date': date,
  //   'time': time,
  //   'time_start': startTime,
  //   'time_end': endTime,
  //   'status': status,
  //   'qrcode': qrcode
  // };

}