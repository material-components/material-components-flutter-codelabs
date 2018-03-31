import 'home.dart';
import 'login.dart';

import 'package:flutter/material.dart';

class ShrineApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/home/login',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/home/login': (BuildContext context) => new LoginPage()
      },
    );
  }
}
