import 'package:App/src/resources/tailieu/ContificationsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home/home_page.dart';
import 'InputDeco.dart';
import 'Profilepassword.dart';


 class Profileuser extends StatefulWidget {
  @override
   State<StatefulWidget> createState(){
    return ProfileuserState();
  }
 }

class ProfileuserState extends State<Profileuser>{
  final GlobalKey<ProfileuserState> formkey = GlobalKey<ProfileuserState>();
  var index = 'Trần Sỹ Tài';
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
                      builder: (context) => HomePage())
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
                  //                                  họ và tên
                  ListTile(
                    title: Text('Họ và Tên: $index'),
                  ),
                  //                               Lớp
                  ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    title: Text('Lớp: '),
                  ),
                  //                                  mssv
                  ListTile(
                    title: Text('MSSV: '),
                  ),
                  //                              nganh
                  ListTile(
                    title: Text('Chuyên Ngành: '),
                  ),
                  //                       năm sinh
                  ListTile(
                    title: Text('Năm Sinh: '),
                  ),
                  //                       Email
                  ListTile(
                    title: Text('Email: '),
                  ),
                  //                       Số Điện Thoại
                  ListTile(
                    title: Text('Số Điện Thoại: '),
                  ),
                  //                       Địa Chỉ
                  ListTile(
                    title: Text('Địa Chỉ: '),
                  ),


                  //                         code form
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       bottom: 15, left: 10, right: 10),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,
                  //     decoration:buildInputDecoration(
                  //         Icons.code,'Mã số sinh viên'+'phan minh tuấn'
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,10),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Profilepassword())
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
  }

}

