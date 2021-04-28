import 'package:flutter/material.dart';



class homepage2 extends StatefulWidget {
  homepage2({Key key }) : super (key: key);
  @override
  _homepage2State createState()=> _homepage2State();

}

class  _homepage2State extends State<homepage2> {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trang Chủ"),
      ),
      body: Center(
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
      ),
      
    );
    
    }
}

