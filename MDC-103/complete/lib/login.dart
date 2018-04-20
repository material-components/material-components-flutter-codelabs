import 'package:flutter/material.dart';

import 'supplemental/theming.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kShrineSurfaceWhite,
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                new Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            new PrimaryColorOverride(
              color: kShrineBrown900,
              child: new TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            new PrimaryColorOverride(
              color: kShrineBrown900,
              child: new TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                new RaisedButton(
                  child: const Text('NEXT'),
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Theme(
      child: child,
      data: Theme.of(context).copyWith(
            primaryColor: color,
          ),
    );
  }
}
