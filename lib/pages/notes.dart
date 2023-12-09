import 'package:flutter/material.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Add a new note',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addNote();
            },
            child: Text('Add Note'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  // Add more functionality like editing or deleting notes if needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addNote() {
    String newNote = noteController.text.trim();
    if (newNote.isNotEmpty) {
      setState(() {
        notes.add(newNote);
        noteController.clear();
      });
    }
  }
}
