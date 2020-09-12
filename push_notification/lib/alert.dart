import 'package:flutter/material.dart';
import 'package:push_notification/booking.dart';

class Alert extends StatelessWidget {
  final title;
  final content;
  Alert({this.content, this.title});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("$title"),
      content: new Text("$context"),
      actions: <Widget>[
        FlatButton(
            child: Text("View"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Booking(),
                  ));
            }),
        FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
