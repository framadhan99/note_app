import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:note_app/data/hive_database.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  // bive database
  final db = HiveDatabase();

  // overall list of notes
  List<Note> allNotes = [
    // default first note
  ];

  // initialize list
  void initializeNote() {
    allNotes = db.loadNotes();
  }

  // get notes
  List<Note> getAllData() {
    return allNotes;
  }

  // add a new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // update note
  void updateNote(Note note, String text) {
    // go thru list of all notes
    for (int i = 0; i < allNotes.length; i++) {
      // find the relevant note
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
