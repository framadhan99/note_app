import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/pages/editing_page_note.dart';
import 'package:provider/provider.dart';

import '../widgets/note_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNote();
  }

  // create a new note
  void createNewNote() {
    // create a new id
    int id = Provider.of<NoteData>(context, listen: false).getAllData().length;

    // create a blank note
    Note newNote = Note(id: id, text: '');

    // go to edit the note
    goToNotePage(newNote, true);
  }

  // go to note editing page
  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(
          note: note,
          isNewNote: isNewNote,
        ),
      ),
    );
  }

  // delete note
  void deleteNote(Note note) {
    Provider.of<NoteData>(context).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.yellow[100],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[400],
          onPressed: createNewNote,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 30),
                    child: Text(
                      'Note',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // list of notes
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: value.getAllData().isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Nothing here ...',
                              style: TextStyle(color: Colors.grey),
                            ))
                        : ListView(
                            children: List.generate(
                              value.getAllData().length,
                              (index) => NoteTile(
                                text: value.getAllData()[index].text,
                                onTap: () => goToNotePage(
                                    value.getAllData()[index], false),
                                delete: () =>
                                    value.deleteNote(value.getAllData()[index]),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
