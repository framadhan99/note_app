import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('note_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
