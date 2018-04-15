import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Shrine',
      home: new HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => new LoginPage(),
      fullscreenDialog: true,
    );
  }
}
