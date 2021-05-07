import 'package:flutter/material.dart';

class Designlichhoc extends StatelessWidget {
  const Designlichhoc({
    Key key,
    @required this.text,
    @required this.icon,
    this.press, Onpress,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFA4E3F3),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
