import 'package:flutter/material.dart';
import 'package:note_app/models/note_data.dart';
import 'package:provider/provider.dart';

import '../widgets/note_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[200],
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
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // list of notes
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView(
                      children: List.generate(
                        value.getAllData().length,
                        (index) => NoteTile(
                          text: 'My Favourite person',
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
