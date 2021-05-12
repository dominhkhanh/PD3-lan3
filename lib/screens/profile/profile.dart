import 'package:flutter/material.dart';
import 'package:app/plugins/flutter_ui_challenges/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/screens/authenticate/authenticate.dart';
import 'package:app/screens/profile/profile_user.dart';

class Profile extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static final String path = "lib/src/pages/settings/settings3.dart";

  String student_id, name, sex, birthday, card_number, address, class_name, faculty_id, specialize_id, phone, email; 
  Future getInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
    });
  }

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
  void initState() {
    super.initState();
    getInfo();
  }

  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Thiết lập',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "TÀI KHOẢN",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(avatars[4]),
                    ),
                    title: Text(name == null ? "" : name),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Thông tin cá nhân"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> ProfileUser())
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "NHẬN THÔNG BÁO",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: Text("Nhận thông báo"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: false,
                    title: Text("Nhận tin tức"),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Đăng xuất"),
                onTap: () {
                  logOut(context);
                },
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}