import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEAE6),
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            new SizedBox(height: 80.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                new SizedBox(height: 16.0),
                new Text('SHRINE', style: Theme.of(context).textTheme.headline,),
              ],
            ),
            new SizedBox(height: 120.0),
            new TextField(
              decoration: new InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            new SizedBox(height: 12.0),
            new TextField(
              decoration: new InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            new ButtonBar(
              children: <Widget>[
                new  FlatButton(
                  child: new Text('CANCEL'),
                  onPressed: null,
                ),
                new RaisedButton(
                  child:new  Text('NEXT'),
                  elevation: 8.0,
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
