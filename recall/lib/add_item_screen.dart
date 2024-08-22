import 'package:flutter/material.dart';

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add New Item',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Item Name'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle item submission
                        Navigator.pop(context);
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Text('Add Item'),
      ),
    );
  }
}
