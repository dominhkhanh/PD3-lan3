import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  var defaultText = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Lịch Học'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                      : Text('Scan a code'),
                ),
              )
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          //   child: QrImage(
          //     data: widget.qrcode,
          //     version: QrVersions.auto,
          //     size: 250,
          //     gapless: false,
          //     embeddedImage: AssetImage(widget.qrcode),
          //     embeddedImageStyle: QrEmbeddedImageStyle(
          //       size: Size(80, 80),
          //     ),
          //     errorStateBuilder: (cxt, err) {
          //       return Container(
          //         child: Center(
          //           child: Text(
          //             "Uh oh! Something went wrong...",
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              widget.subject_name,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              widget.class_name,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Giảng viên: " + widget.teacher_name,
              style: Theme.of(context).textTheme.subtitle1
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Ngày học: " + widget.date,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Ca học: " + widget.time_name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Nội dung: " + widget.contents,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}