import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WritingPage extends StatefulWidget {
  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _storyController = TextEditingController();
  int _viewCount = 0;
  File? _image;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write a New Book'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _storyController,
                decoration: InputDecoration(labelText: 'Write your story here...'),
                maxLines: null,
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.add_a_photo),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Book Cover',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: _getImage,
                          child: Text('Choose Image'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'View Count: $_viewCount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _publishBook,
                    child: Text('Create Book'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _publishBook() async {
    final String title = _titleController.text.trim();
    final String author = _authorController.text.trim();
    final String description = _descriptionController.text.trim();
    final String story = _storyController.text.trim();

    if (title.isNotEmpty && author.isNotEmpty && description.isNotEmpty && story.isNotEmpty) {
      try {
          await FirebaseFirestore.instance.collection('stories').add({
          'title': title,
          'author': author,
          'description': description,
          'story': story,
          'viewCount': _viewCount,
          'timestamp': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Story created successfully!'),
          ),
        );

        _titleController.clear();
        _authorController.clear();
        _descriptionController.clear();
        _storyController.clear();
        setState(() {
          _image = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create story: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields before creating the story!'),
        ),
      );
    }
  }
}
