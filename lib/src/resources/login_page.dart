import 'package:App/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginBloc bloc = new  LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  

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
              Padding(
                padding:const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child:Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffd8d8d8)
                ),
                child: FlutterLogo()),
              ),  
            Padding(
                padding:const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text("APP Tương Tác Sinh Viên", 
                style: TextStyle(
                fontWeight: FontWeight.bold, 
                color:Colors.lightBlue,
                fontSize: 30),
                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0 , 40 ),
              child: StreamBuilder(
                stream: bloc.userStream,
                
                builder: (context, snapshot) => TextField(
                style: TextStyle(fontSize: 18),
                controller: _userController,
                decoration: InputDecoration(
                labelText: "USERNAME",
                errorText: snapshot.hasError ? snapshot.error:null,
                labelStyle: TextStyle
                (color: Color(0xff888888),
                fontSize: 15)
                ),
            ),
             ) 
            ),
            
            Padding(
             padding: const EdgeInsets.fromLTRB(0, 0, 0 , 40 ),
              child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children : <Widget>[
                StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context , snapshot)=> TextField(
                  style: TextStyle(fontSize: 18),
                  controller: _passController,
                  obscureText: !_showPass,
                decoration: InputDecoration(
                  labelText: "PASSWORD",
                  errorText: snapshot.hasError ? snapshot.error:null,
                  labelStyle: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15)),
                ),
                ),
                
              GestureDetector(
                onTap: onToggleShowPass,
                child: Text(
                "SHOW",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,fontWeight: 
                  FontWeight.bold 
                  ),
                )
              )
                
              ]
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0 , 40 ),
              child:SizedBox(
              width: double.infinity,
              height: 56,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                  Radius.circular(8)
                  )
                  ),
                onPressed: onSingInClicked,
                child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 16)),

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
                      "NEW USER? SIGN UP",
                      style: TextStyle(fontSize: 15,color:Color(0xff888888))
                    ),
                    Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(fontSize: 15,color:Colors.blue),
                    ),
                  ],
                ),
              ),

            
            ],
          ),
        ),
      );
  }

  void onToggleShowPass(){
      setState(() {
        _showPass = ! _showPass;
      });
  }

  void onSingInClicked(){
      if(bloc.isValidInfo(_userController.text, _passController.text)){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
        
      }
  }
      

    
  Widget gotoHome(BuildContext context){
    return HomePage();
  }
}