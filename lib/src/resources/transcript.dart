import 'dart:ffi';

import 'package:flutter/material.dart';  

class transcript extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("transcript",
          ),
        ),
         

       
        body: Center(  
              
              child: Column(children: <Widget>[  
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text("Bảng Điểm Sinh Viên",style: TextStyle(fontSize: 20.0)

                )
              ),
                Container(  
                  margin: EdgeInsets.all(23),  
                  child: Table(  
                    defaultColumnWidth: FixedColumnWidth(90.0),  
                    border: TableBorder.all(  
                        color: Colors.blue,  
                        style: BorderStyle.solid,  
                        width: 1),  
                    children: [  
                      TableRow(children: [  
                        TableCell(child: Text('Môn Học')),  
                        TableCell(  
                          child: Text('Diem 1'),  
                        ),  
                        TableCell(child: Text('Diem 2')),  
                        TableCell(child: Text('Diem Tong')),  

                      ]), 
                      TableRow(children: [  
                        TableCell(child: Text('')),  
                        TableCell(  
                          child: Text(''),  
                        ),  
                        TableCell(child: Text('')),  
                        TableCell(child: Text('')),  
                        
                      ]),
                      TableRow(children: [  
                        TableCell(child: Text('')),  
                        TableCell(  
                          child: Text(''),  
                        ),  
                        TableCell(child: Text('')),  
                        TableCell(child: Text('')),  
                        
                      ]), 
                      TableRow(children: [  
                        TableCell(child: Text('')),  
                        TableCell(  
                          child: Text(''),  
                        ),  
                        TableCell(child: Text('')),  
                        TableCell(child: Text('')),  
                        
                      ]), 
                      TableRow(children: [  
                        TableCell(child: Text('')),  
                        TableCell(  
                          child: Text(''),  
                        ),  
                        TableCell(child: Text('')),  
                        TableCell(child: Text('')),  
                        
                      ]), 
                      TableRow(children: [  
                        TableCell(child: Text('')),  
                        TableCell(  
                          child: Text(''),  
                        ),  
                        TableCell(child: Text('')),  
                        TableCell(child: Text('')),  
                        
                      ]), 
                       
                    ],  
                  ),  
                ),  
              ])
        )  
    );
  }
}