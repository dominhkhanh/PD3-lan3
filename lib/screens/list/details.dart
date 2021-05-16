import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget{
  // ignore: non_constant_identifier_names
  String id, teacher_name, subject_name, class_name, contents, link, time_name, date, qrcode;

  // ignore: non_constant_identifier_names
  Detail({Key key, this.teacher_name, this.subject_name, this.class_name, this.time_name, this.contents, this.link, this.date, this.qrcode}) : super(key: key);
  
  @override
  _DetailState createState() => new _DetailState();
}
class _DetailState extends State<Detail>{
  String qrCode = 'Unknown';
  var defaultText = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Lịch Học'),
      ),
      body: ListView(
        children: <Widget>[
          Center (
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: QrImage(
                data: widget.link,
                version: QrVersions.auto,
                size: 250,
                gapless: false,
                errorStateBuilder: (cxt, err) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Uh oh! Something went wrong...",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            title: Text(
              widget.subject_name,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              widget.class_name,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            title: Text(
              "Giảng viên: " + widget.teacher_name,
              style: Theme.of(context).textTheme.subtitle1
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            title: Text(
              "Ngày học: " + widget.date,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            title: Text(
              "Ca học: " + widget.time_name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            title: Text(
              "Nội dung: " + widget.contents,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
            child: SizedBox(
              width: 50,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () => scanQRCode(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color:Colors.blue)
                ),
                textColor: Colors.white, 
                child: Text('Bắt đầu học'),
              ),
            ),
          )
        ],
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