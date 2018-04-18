import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
import 'login.dart';
import 'notched_corner_border.dart';
import 'supplemental/theming.dart';

class ShrineApp extends StatelessWidget {
  ThemeData _customTheme(BuildContext context) {
    return Theme.of(context).copyWith(
          accentColor: kShrineBrown,
          primaryColor: kShrinePeachPrimary,
          buttonColor: kShrinePeachPrimary,
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white,
          textSelectionColor: kShrinePeachPrimary,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.accent,
          ),
          textTheme: _customTextTheme(Theme.of(context).textTheme),
          primaryTextTheme:
              _customTextTheme(Theme.of(context).primaryTextTheme),
          primaryIconTheme:
              _customIconTheme(Theme.of(context).primaryIconTheme),
          inputDecorationTheme:
              InputDecorationTheme(border: NotchedCornerBorder()),
        );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: kShrineBrown);
  }

  TextTheme _customTextTheme(TextTheme original) {
    const String rubik = 'Rubik';

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
          title: original.title.copyWith(fontFamily: rubik, fontSize: 18.0),
          subhead: original.subhead.copyWith(fontFamily: rubik),
          caption: original.caption.copyWith(
            fontFamily: rubik,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          button: original.button.copyWith(fontFamily: rubik),
        )
        .apply(
          displayColor: kShrineBrown,
          bodyColor: kShrineBrown,
        );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'Shrine',
      home: new HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _customTheme(context),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return new MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => new LoginPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  }
}
