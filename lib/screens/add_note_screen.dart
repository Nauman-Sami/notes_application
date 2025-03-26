import 'package:flutter/material.dart';
import '../models/note.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void saveNote() {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      final newNote = Note(
        title: _titleController.text,
        content: _contentController.text,
      );
      Navigator.pop(context, newNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("ADD NOTE"),
      centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "TITLE"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: "CONTENT"),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Save"),
              onPressed: saveNote,
            ),
          ],
        ),
      ),
    );
  }
}
