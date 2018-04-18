import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            new TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            new TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
