import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('SHRINE'),
      ),
      body: const Center(
        child: const Text('You did it!'),
      ),
    );
  }
}
