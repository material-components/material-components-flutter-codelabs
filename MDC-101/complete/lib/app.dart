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
      routes: <String, WidgetBuilder> { //5
        '/home': (BuildContext context) => new HomePage(), //6
        '/home/login' : (BuildContext context) => new LoginPage() //7
      },
    );
  }
}
