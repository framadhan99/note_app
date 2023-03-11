import 'package:flutter/material.dart';
import 'package:note_app/models/note_data.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({super.key, required this.note, required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  // load exinting note
  void loadExistingNote() {
    _controller.text = widget.note.text;
  }

  // add new note
  void addNewNote() {
    // get new id
    int id = Provider.of<NoteData>(context, listen: false).getAllData().length;
    // get text from editor
    String text = _controller.text;
    // add new note
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, text: text));
  }

  // update existing note
  void updateNote() {
    // get text from editor
    String text = _controller.text;
    // update note
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              // add new note
              if (widget.isNewNote) {
                addNewNote();
              } else {
                updateNote();
              }
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _controller,
                expands: true,
                maxLines: null,
                minLines: null,
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                    hintText: 'writing your note ...',
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
