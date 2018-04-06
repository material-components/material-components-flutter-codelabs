import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {

  TextTheme _applyCustomFonts(TextTheme original) {
    const String rubik = 'Rubik';
    print('****');
    print(original.headline.fontWeight);
    return original.copyWith(
      display4: original.display4.apply(fontFamily: rubik),
      display3: original.display3.apply(fontFamily: rubik),
      display2: original.display2.apply(fontFamily: rubik),
      display1: original.display1.apply(fontFamily: rubik),
      headline: original.headline.apply(fontWeightDelta: -1, fontFamily: rubik, ),
      title: original.title.apply(fontFamily: rubik),
      subhead: original.subhead.apply(fontFamily: rubik),
      caption: original.caption.apply(fontFamily: rubik),
      button: original.button.apply(fontFamily: rubik),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: ThemeData(
        primaryColor: Color(0xFFFEEAE6),
        buttonColor: Color(0xFFFCB8AB),
        accentColor: Color(0xFF442B2D),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent,),
        textTheme: _applyCustomFonts(ThemeData.light().textTheme),
      ),
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
