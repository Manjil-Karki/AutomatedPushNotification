import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/alert.dart';
import 'package:push_notification/booking.dart';

class PushNotificationService {
  final BuildContext context;
  PushNotificationService({this.context});
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final CollectionReference deviceReference =
      Firestore.instance.collection('DeviceTokens');

  
  void getToken() {
    _fcm
        .getToken()
        .then((value) => {
              deviceReference.document('tokens').setData({'uid': value})
            })
        .catchError((error) => print("Failed to add user: $error"));
  }
  //add to firebase)

  Future initialise() async {
    _fcm.configure(onMessage: (Map<String, dynamic> message) async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Alert(
              title: message['notification']['title'],
              content: message['notification']['body'],
            ),
          ));
      print("onMessage: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Booking(),
          ));
    }, onResume: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Booking(),
          ));
    });
  }
}
