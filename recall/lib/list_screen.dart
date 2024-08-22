import 'package:flutter/material.dart';
import 'dart:io'; // Import this to handle File type for the image

class ListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  ListScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(child: Text('No items added yet'))
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: item['image'] == null
                      ? CircleAvatar(child: Icon(Icons.image))
                      : CircleAvatar(
                          backgroundImage: FileImage(item['image']),
                        ),
                  title: Text(item['name']),
                  subtitle: Text(item['description']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(item['name']),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              item['image'] == null
                                  ? Text('No image available')
                                  : Image.file(item['image']),
                              SizedBox(height: 10),
                              Text(item['description']),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
  }
}
