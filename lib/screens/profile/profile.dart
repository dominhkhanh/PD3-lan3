import 'package:app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String student_id, name, sex, birthday, card_number, address, class_name, faculty_id, specialize_id, phone, email; 
  Future getInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      student_id = preferences.getString("student_id");
      name = preferences.getString("name");
      sex = preferences.getString("sex");
      birthday = preferences.getString("birthday");
      card_number = preferences.getString("card_number");
      address = preferences.getString("address");
      class_name = preferences.getString("class_name");
      phone = preferences.getString("phone");
      email = preferences.getString("email");
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thông Tin Cá Nhân"),
          // leading:
          //     IconButton(icon: Icon(Icons.arrow_back), onPressed: () {})
        ),
        // phần thân
        body: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://scontent-xsp1-1.xx.fbcdn.net/v/t1.6435-9/118779813_986618455139433_1760688081225491772_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=174925&_nc_ohc=8TRc3IQyhi0AX9ME4KO&_nc_oc=AQnRAmaZ19xUHDxP4CK2garlUQQdUts1yJdo6Qr_HfORh_RSvoMtVQDil62hJBJZAf2chtvUDMfv93FqFEmuiRZQ&_nc_ht=scontent-xsp1-1.xx&oh=d757d630705df01f40003edabe193526&oe=60A0616C'))),
                        ), //avatar
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: Colors.grey),
                              child: Icon(
                                Icons.camera,
                                color: Colors.white,
                              )),
                        ) //iconcamera
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  buildTextField("Mã số sinh viên", student_id), 
                  buildTextField("Họ Và Tên", name),
                  buildTextField("Giới Tính", sex),
                  buildTextField("Ngày Sinh", birthday),
                  buildTextField("Lớp", class_name),
                  buildTextField("Số điện thoại", phone),
                  buildTextField("Địa Chỉ", address),
                  buildTextField("Email", email),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlineButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text("Đổi Mật Khẩu",
                            style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 2,
                                color: Colors.black)),
                      ),
                      OutlineButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          logOut(context);
                        },
                        child: Text("Đăng Xuất",
                            style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 2,
                                color: Colors.black
                        )),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    // bool isPasswordTextField
    return Padding(
      padding: EdgeInsets.only(left: 30, bottom: 0, right: 30),
      child: TextField(
        // obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            // suffixIcon: isPasswordTextField ?
            // IconButton(
            //     icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
            //     onPressed: () {}
            // ): null,
            contentPadding: EdgeInsets.only(bottom: 0),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
