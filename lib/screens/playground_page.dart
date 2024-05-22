import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playground Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Add playground page here',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
