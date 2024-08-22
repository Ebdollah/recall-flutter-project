import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the SplashScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
