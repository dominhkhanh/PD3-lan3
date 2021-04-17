import 'package:flutter/material.dart';  



class Profile extends StatefulWidget {
  Profile({Key key }) : super (key: key);
  @override
  _ProfileState createState()=> _ProfileState();

}
  

class  _ProfileState extends State<Profile> {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"), 
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0 , 0 ),
              child:SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)
                      )
                  ),
                  child: Text("Hình ảnh",style: TextStyle(color: Colors.white,fontSize: 10)),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("Name:"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text("MSSV:"),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Ngày tháng năm sinh:"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Số điện thoại:"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Email:"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Địa chỉ:"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0 , 0 ),
              child:SizedBox(
                width: double.infinity,
                height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)
                      )
                  ),
                  child: Text("Đổi mật khẩu",style: TextStyle(color: Colors.white,fontSize: 10)),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0 , 30 ),
              child:SizedBox(
                width: double.infinity,
                height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)
                      )
                  ),
                  child: Text("Đăng xuất tài khoản",style: TextStyle(color: Colors.white,fontSize: 10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
    }
}


