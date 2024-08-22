import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Ensure you have this package added in pubspec.yaml
import 'dart:io'; // To handle File type for the image

class AddItemScreen extends StatefulWidget {
  final Function(String, String, File) onAddItem;

  AddItemScreen({required this.onAddItem});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image; // Store the selected image

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, height: 200, width: 200), // Display the image if available
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _image != null) {
                  widget.onAddItem(
                    _nameController.text,
                    _descriptionController.text,
                    _image!,
                  );
                  Navigator.pop(context);
                } else {
                  // Show an error message or handle accordingly
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
