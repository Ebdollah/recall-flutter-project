import 'package:flutter/material.dart';
import 'add_item_screen.dart'; 
import 'list_screen.dart'; 
import 'dart:io'; // Import this to handle File type for the image

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _items = [];

  void _addItem(String name, String description, File image) {
    setState(() {
      _items.add({
        'name': name,
        'description': description,
        'image': image,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recall App'),
      ),
      body: _selectedIndex == 0
          ? AddItemScreen(onAddItem: _addItem)
          : ListScreen(items: _items),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
