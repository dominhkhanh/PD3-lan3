import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget{
  final int index;

  DetailPages(this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Lịch Học'),
      ),
        body:Center(
          child: Container(
            child: Text('#$index'),
          ),
        ),
    );
  }
}