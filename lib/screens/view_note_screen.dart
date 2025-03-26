import 'package:flutter/material.dart';
import '../models/note.dart';

class ViewNoteScreen extends StatelessWidget {
  final Note note;

  ViewNoteScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(note.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(note.content, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
