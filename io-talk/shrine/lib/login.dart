import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget _buildLogo(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('assets/diamond.png'),
        SizedBox(height: 16.0),
        new Text(
          'SHRINE',
          style: Theme.of(context).textTheme.headline,
        ),
      ],
    );
  }

  // TODO customize this during talk
  //   - add filled, colors, border, etc.
  Widget _buildUsernameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Username',
      ),
    );
  }

  // TODO customize this during talk
  Widget _buildPasswordField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  // TODO customize this during talk
  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: null,
        ),
        new RaisedButton(
          child: Text('NEXT'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            _buildLogo(context),
            SizedBox(height: 120.0),
            _buildUsernameField(),
            SizedBox(height: 12.0),
            _buildPasswordField(),
            _buildButtonBar(context),
          ],
        ),
      ),
    );
  }
}
