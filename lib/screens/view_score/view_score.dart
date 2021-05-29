import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewScore extends StatefulWidget {
    ViewScore({Key key}) : super(key: key);

  @override
  _ViewScoreState createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {
  List<dynamic> list_info_score;
  String student_id, subject_name, process_score, medium_score, rank;
  Future getInfoScore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      student_id = preferences.getString("id");
    });
    Uri uri = Uri.parse("http://10.0.3.2:8080/db_flutter/controllers/get_score_by_student.php");
    var response = await http.post(
      uri, 
      body: { "student_id": student_id }
    );
    this.setState(() {
      list_info_score = json.decode(response.body);
    });
  }

  @override
  void initState() { 
    super.initState();
    getInfoScore();
    print(list_info_score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Xem Điểm",
        ),
      ),
      body: SingleChildScrollView( 
        scrollDirection: Axis.horizontal, 
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Môn học',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Điểm quá trình',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Điểm cuối kì',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Điểm trung bình',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Xếp hạng',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            // ignore: unrelated_type_equality_checks
            list_info_score == null ? 0 : list_info_score.length,
            (index) {
              return DataRow(
                cells: [
                  DataCell(Text(list_info_score[index]['subject_name'] == null ? "Chưa cập nhật" : list_info_score[index]['subject_name'])),
                  DataCell(Text(list_info_score[index]['process_point'] == null ? "Chưa cập nhật" : list_info_score[index]['process_point'].toString())),
                  DataCell(Text(list_info_score[index]['final_point'] == null ? "Chưa cập nhật" : list_info_score[index]['final_point'].toString())),
                  DataCell(Text(list_info_score[index]['medium_score'] == null ? "Chưa cập nhật" : list_info_score[index]['medium_score'].toString())),
                  DataCell(Text(list_info_score[index]['rank'] == null ? "Chưa cập nhật" : list_info_score[index]['rank']))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
