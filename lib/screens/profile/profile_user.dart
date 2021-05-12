import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/navigation/nav_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/screens/authenticate/forgot_password.dart';

class ProfileUser extends StatefulWidget {
  ProfileUser({Key key }) : super (key: key);
  @override
  _ProfileUserState createState()=> _ProfileUserState();
}

class  _ProfileUserState extends State<ProfileUser> {
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
            centerTitle: true,
            title: Text("Thông Tin Cá Nhân"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NavigationBottom())
                  );
                }
            )
        ),
        // phần thân
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://scontent-xsp1-1.xx.fbcdn.net/v/t1.6435-9/118779813_986618455139433_1760688081225491772_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=174925&_nc_ohc=8TRc3IQyhi0AX9ME4KO&_nc_oc=AQnRAmaZ19xUHDxP4CK2garlUQQdUts1yJdo6Qr_HfORh_RSvoMtVQDil62hJBJZAf2chtvUDMfv93FqFEmuiRZQ&_nc_ht=scontent-xsp1-1.xx&oh=d757d630705df01f40003edabe193526&oe=60A0616C"),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //                                  mssv
                  ListTile(
                    leading: Text('MSSV: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title: Text(student_id, style: const TextStyle(fontSize: 20))
                  ),
                  //                                  họ và tên
                  ListTile(
                    leading: Text('Họ và Tên: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(name, style: const TextStyle(fontSize: 20)),
                  ),
                  //                               Lớp
                  ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    leading: Text('Lớp: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(class_name, style: const TextStyle(fontSize: 20)),
                  ),
                  //                              nganh
                  ListTile(
                    leading: Text('Ngành: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  //                       năm sinh
                  ListTile(
                    leading: Text('Ngày Sinh: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(birthday, style: const TextStyle(fontSize: 20)),
                  ),
                  //                       Email
                  ListTile(
                    leading: Text('Email: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(email, style: const TextStyle(fontSize: 20)),
                  ),
                  //                       Số Điện Thoại
                  ListTile(
                    leading: Text('Số Điện Thoại: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(phone, style: const TextStyle(fontSize: 20)),
                  ),
                  //                       Địa Chỉ
                  ListTile(
                    leading: Text('Địa Chỉ: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    title:  Text(address, style: const TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,10),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> ProfilePassword())
                        );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color:Colors.blue)
                        ),
                        textColor: Colors.white,child: Text('Đổi mật khẩu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}