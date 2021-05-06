

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tailieu/ContificationsPage.dart';
import 'ProfileMenu.dart';
import 'ProfilePic.dart';
import 'Profileuser.dart';

class Profilemain extends StatefulWidget {
  Profilemain({Key key }) : super (key: key);
  @override
  _ProfileState createState()=> _ProfileState();
}
  

class  _ProfileState extends State<Profilemain> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(

      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 15),
          ProfileMenu(
            text: "Tài khoản",
            icon: "assets/icons/User Icon.svg",
            press:() => {Navigator.push(context, MaterialPageRoute(
                builder: (context)=> Profileuser())
              )
            },
          ),
          ProfileMenu(
            text: "Thông Báo",
            icon: "assets/icons/Bell.svg",
            press:() => {Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ContificationsPage())
            )},
          ),
          ProfileMenu(
            text: "Cài Đặt",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Hổ Trợ",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng Xuất",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

