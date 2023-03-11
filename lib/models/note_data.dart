import 'package:flutter/cupertino.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  // overall list of notes
  List<Note> allNotes = [
    // default first note
    Note(id: 0, text: 'First Note' * 100),
    Note(id: 1, text: 'First Note' * 5),
  ];

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
