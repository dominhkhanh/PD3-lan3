import 'package:flutter/material.dart';
import 'package:app/screens/profile/form_info.dart';
import 'package:app/screens/profile/profile_user.dart';
class ProfilePassword extends StatefulWidget {
  @override
  _ProfilePasswordState createState() => _ProfilePasswordState();
}
class _ProfilePasswordState extends State<ProfilePassword> {
  //TextController to read text entered in text field

  TextEditingController passwordold = TextEditingController();
  TextEditingController passwordnew = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Đổi Mật Khẩu"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProfileUser())
                );
              }
          )
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: passwordold,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Mật Khẩu cũ"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Hãy nhập mật khẩu cũ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: passwordnew,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Mật Khẩu Mới"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Hãy nhập mật khẩu';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Xác nhận mật khẩu"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Hãy nhập lại mật khẩu mới';
                      }
                      print(passwordnew.text);
                      print(confirmpassword.text);
                      if(passwordnew.text!=confirmpassword.text){
                        return "Không khớp mật khẩu. Vui lòng thử lại !!!";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: (){
                      if(_formkey.currentState.validate())
                      {
                        print("Thành công");
                        return;
                      }else{
                        print("Không thành công");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}