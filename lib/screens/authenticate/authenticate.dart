import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/src/blocs/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/navigation/nav_bottom.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var student_id = preferences.getString('student_id');
  runApp(MaterialApp(home: student_id == null ? Authenticate() : NavigationBottom()));
}

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => new _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  LoginBloc bloc = new LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  Future login() async {
    Uri myUri = Uri.parse("http://10.0.3.2:8080/db_flutter/controllers/login.php");
    var response = await http.post(myUri, body: {
      "student_id": _userController.text,
      "password": _passController.text,
    });
    var user =  json.decode(response.body);
    if (user != "") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('id', user[0]);
      preferences.setString('student_id', _userController.text);
      preferences.setString('name', user[2]);
      preferences.setString('sex', user[3]);
      preferences.setString('birthday', user[4]);
      preferences.setString('card_number', user[5]);
      preferences.setString('address', user[6]);
      preferences.setString('class_id', user[7]);
      preferences.setString('class_name', user[8]);
      preferences.setString('faculty_id', user[9]);
      preferences.setString('specialize_id', user[10]);
      preferences.setString('phone', user[11]);
      preferences.setString('email', user[12]);
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBottom()));
    }
    else if (user == "Do not account") {
      Fluttertoast.showToast(
        msg: "Tài khoản không hợp lệ.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.lightBlue[10],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
              radius: 50.0,
              backgroundColor: Color(0xfafafa),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                "Interactive Learning",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) => TextField(
                  style: TextStyle(fontSize: 18),
                  controller: _userController,
                  decoration: InputDecoration(
                      labelText: "Mã số sinh viên",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.passStream,
                    builder: (context, snapshot) => TextField(
                      style: TextStyle(fontSize: 18),
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                  ),
                  GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        "Hiện",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: onSignInClicked,
                  child: Text("Đăng Nhập",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Quên mật khẩu",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    if (bloc.isValidInfo(_userController.text, _passController.text)) {
      login();
    }
  }

  Widget gotoHome(BuildContext context) {
    return Home();
  }
}
