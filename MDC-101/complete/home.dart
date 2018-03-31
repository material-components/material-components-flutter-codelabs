import 'login.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _needsLogin = true;

  void _presentLogin() {
    if (_needsLogin) {
      Navigator.push((context), _createRoute());
      _needsLogin = false;
    }
  }

  MaterialPageRoute _createRoute() {
    var route = MaterialPageRoute(builder: (_) => LoginPage());
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('You did it!'),
      ),
    );
  }
}
