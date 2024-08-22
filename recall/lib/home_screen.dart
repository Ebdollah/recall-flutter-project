import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recall Home'),
      ),
      body: Center(
        child: Text(
          'Welcome to Recall!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
