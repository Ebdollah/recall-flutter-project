import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'user_provider.dart'; // Import UserProvider

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _userName;

  void _updateUserName(String name) {
    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userName: _userName,
      updateUserName: _updateUserName,
      child: MaterialApp(
        title: 'Recall',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
