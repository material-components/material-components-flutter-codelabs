import 'package:flutter/material.dart';

class DiamondHamburger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Center(
        child: new Container(
          height: 60.0,
          width: 60.0,
          color: Colors.pink[50],
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                new Positioned(
                  left: 0.0,
                  child: Center(
                    child: new Icon(
                      Icons.menu,
                      size: 32.0,
                      color: Colors.brown[400],
                    ),
                  ),
                ),
                new Positioned(
                  left: 16.0,
                  child: new Image.asset(
                    'assets/diamond.png',
                    width: 32.0,
                    height: 32.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
