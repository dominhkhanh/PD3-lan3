import 'package:flutter/material.dart';
import 'package:app/models/Booking.dart';

class EventDetail extends StatefulWidget {
  final BookingModel event;
  const EventDetail({Key key, this.event}) : super(key: key);
  @override
  _EventDetailState createState() => new _EventDetailState();
}
class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Note details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.event.subject, style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0),
            Text(widget.event.date.toString() + " - " + widget.event.time)
          ],
        ),
      ),
    );
  }
}
