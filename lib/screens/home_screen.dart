import 'package:flutter/material.dart';
import '../models/note.dart';
import 'add_note_screen.dart';
import 'view_note_screen.dart';
import '../widgets/note_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  void addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomAppBar(
        child: Padding(padding: EdgeInsets.all(5),
        child: Text('Made by NAUMAN SAMI'),
        ),
      color: Colors.grey,

      ),
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("NOTES APPLICATION"),
          centerTitle: true,
        

      ),

      body: notes.isEmpty
          ? Center(child: Text("No notes yet!"))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteTile(
            note: notes[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewNoteScreen(note: notes[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        child: Icon(Icons.add),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
          if (newNote != null) {
            addNote(newNote);
          }
        },
      ),
    );
  }
}
