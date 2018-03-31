import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Container(
            child: Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'SHRINE',
                ),
              ],
            ),
          ),
          SizedBox(height: 121.0),
          TextField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              filled: true,
              labelText: "Username",
            ),
          ),
          SizedBox(height: 13.0),
          TextField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              filled: true,
              labelText: "Password",
            ),
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("CANCEL"),
              ),
              SizedBox(
                width: 16.0,
              ),
              RaisedButton(
                  child: Text("NEXT"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          )
        ],
      ),
    ));
  }
}
