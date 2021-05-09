import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/notification/notification.dart';
import 'package:app/screens/profile/profile_menu.dart';
import 'package:app/screens/profile/profile_picture.dart';
import 'package:app/screens/profile/profile_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/screens/authenticate/authenticate.dart';

class Profile extends StatefulWidget {
  Profile({Key key }) : super (key: key);
  @override
  _ProfileState createState()=> _ProfileState();
}
  
class  _ProfileState extends State<Profile> {
  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('student_id');
    preferences.remove('name');
    preferences.remove('sex');
    preferences.remove('birthday');
    preferences.remove('card_number');
    preferences.remove('address');
    preferences.remove('class_id');
    preferences.remove('class_name');
    preferences.remove('faculty_id');
    preferences.remove('specialize_id');
    preferences.remove('phone');
    preferences.remove('email');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Authenticate()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(height: 15),
          ProfileMenu(
            text: "Tài khoản",
            icon: "assets/icons/round-account-button-with-user-inside.svg",
            press:() => {Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProfileUser())
              )
            },
          ),
          ProfileMenu(
            text: "Thông Báo",
            icon: "assets/icons/Bell.svg",
            press:() => {Navigator.push(context, MaterialPageRoute(
                builder: (context)=> Notify())
            )},
          ),
          ProfileMenu(
            text: "Cài Đặt",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng Xuất",
            icon: "assets/icons/Log out.svg",
            press: () {
              logOut(context);
            },
          ),
        ],
      ),
    );
  }
}

