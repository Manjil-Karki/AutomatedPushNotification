import 'package:flutter/material.dart';
import 'package:push_notification/push_notification_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    PushNotificationService(context: context).initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('send token initially'),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => {PushNotificationService().getToken()},
          child: Text('get and send token'),
        ),
      ),
    );
  }
}
