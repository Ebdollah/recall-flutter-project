import 'package:flutter/material.dart';
import 'user_provider.dart'; // Import UserProvider

class HomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider.of(context);
    final userName = userProvider?.userName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recall Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName == null
                    ? 'Welcome to Recall!'
                    : 'Welcome, $userName!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  userProvider?.updateUserName(_nameController.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
