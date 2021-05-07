import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'thietketailieu.dart';

class ContificationsPage extends StatefulWidget {
  ContificationsPage({Key key }) : super (key: key);
  @override
  _ContificationsPageState createState()=> _ContificationsPageState();

}
  

class  _ContificationsPageState extends State<ContificationsPage> {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tài Liệu"),
      ),
      body: Center(
        child: Column(
          children: [
            Document(
              text: "Lập trình hướng đối tượng",
              icon: "assets/icons/Bell.svg",
              press:() => {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> tailieu())
              )},
            ),
          ],
        ),
      ),
      
    );
    }
}

class tailieu extends StatelessWidget{
  var defaultText = TextStyle(color: Colors.black);
  var LinkText = TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài Liệu'),
      ),
      body:Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: defaultText,
                text: 'Lập trình hướng đối tượng: '
              ),
              TextSpan(
                  style: LinkText,
                  text: "Click here",
                  recognizer: TapGestureRecognizer()..onTap = () async{
                    var url = "https://www.youtube.com/";
                    if(await canLaunch(url)){
                      await launch(url);
                    }else{
                      throw "Link không tồn tại";
                    }
                  }
              )
            ]
          ),
        ),
      ),
    );
  }
}



