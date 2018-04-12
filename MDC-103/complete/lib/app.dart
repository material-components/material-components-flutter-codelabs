import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  ThemeData _customTheme(BuildContext context) {
    return Theme.of(context).copyWith(
          accentColor: Color(0xFF442B2D),
          primaryColor: Color(0xFFFFDBCF),
          buttonColor: Color(0xFFFCB8AB),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          cardColor: Color(0xFFFFFFFF),
          buttonTheme: new ButtonThemeData(
            textTheme: ButtonTextTheme.accent,
          ),
          textTheme: _customTextTheme(Theme.of(context).textTheme),
          primaryTextTheme:
              _customTextTheme(Theme.of(context).primaryTextTheme),
          primaryIconTheme:
              _customIconTheme(Theme.of(context).primaryIconTheme),
        );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: Color(0xFF442B2D));
  }

  TextTheme _customTextTheme(TextTheme original) {
    String rubik = 'Rubik';

    return original
        .copyWith(
          display4: original.display4.copyWith(fontFamily: rubik),
          display3: original.display3.copyWith(fontFamily: rubik),
          display2: original.display2.copyWith(fontFamily: rubik),
          display1: original.display1.copyWith(fontFamily: rubik),
          headline: original.headline.copyWith(
            fontFamily: rubik,
            fontWeight: FontWeight.w500,
          ),
          title: original.title.copyWith(fontFamily: rubik, fontSize: 14.0),
          subhead: original.subhead.copyWith(fontFamily: rubik, fontSize: 14.0),
          caption: original.caption.copyWith(fontFamily: rubik),
          button: original.button.copyWith(fontFamily: rubik),
        )
        .apply(
          displayColor: Color(0xFF442B2D),
          bodyColor: Color(0xFF442B2D),
        );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _customTheme(context),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  }
}
