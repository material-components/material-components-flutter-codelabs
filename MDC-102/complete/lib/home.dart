import 'package:flutter/material.dart';

List<Card> _buildGridCards(BuildContext context, int count) {
  List<Card> cards = List.generate(
      count,
      (int index) => Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Image.asset(
                    'assets/$index-1.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    16.0,
                    12.0,
                    16.0,
                    8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // TODO(larche): Make headline6 when available
                      Text('Tea Cups',
                          style: Theme.of(context).textTheme.caption),
                      //SizedBox(height: 8.0,),
                      // TODO(larche): Make subtitle2 when available
                      Text('\$36', style: Theme.of(context).textTheme.body2),
                    ],
                  ),
                ))
              ],
            ),
          ));

  return cards;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu button');
            }),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search button');
              }),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () {
                print('Filter button');
              }),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: _buildGridCards(context, 4),
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
