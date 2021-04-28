import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:App/src/resources/ListLichHoc/details.dart';


class ListSchedule extends StatefulWidget {
  ListSchedule({Key key }) : super (key: key);
  @override
  _ListSchedule createState()=> _ListSchedule();
}

class  _ListSchedule extends State<ListSchedule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
          title: Text("Danh Sách Lịch Học"),
            // leading: IconButton(
            //         icon: Icon(Icons.arrow_back),
            //         onPressed: () {
            //         }
            // )
          ),
          body: _buildListView(context),
        )
    );
  }
  ListView _buildListView(BuildContext buildContext){
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (_, index){
          return ListTile(
            title: Text('Lịch Học Công Cụ Phần Mềm $index'),
            leading: Icon(Icons.book),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPages(index))
              );
            },
          );
        },
    );
  }
}

class DetailPages extends StatelessWidget{
final int index;

DetailPages(this.index);
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    appBar: AppBar(
      title: Text('Chi Tiết Lịch Học'),
    ),
    body:Center(
      child: Container(
        child: Text('  Nội dung lịch học'), // $index
      ),
    ),
  );
}
}
