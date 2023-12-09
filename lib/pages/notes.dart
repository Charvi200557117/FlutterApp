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
  // List to store the notes
  List<String> notes = [];
  // Controller for the text input field
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: Column(
        children: [
          // Text input field to add a new note
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Add a new note',
              ),
            ),
          ),
          // Button to add a new note
          ElevatedButton(
            onPressed: () {
              addNote();
            },
            child: Text('Add Note'),
          ),
          SizedBox(height: 20),
          // Display the list of notes using a ListView
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

  // Function to add a new note to the list
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
