import 'package:flutter/material.dart';

class PracticalFactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factorials Page'),
      ),
      body: Center(
        child: Text(
          'This is the Factorials Page.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
