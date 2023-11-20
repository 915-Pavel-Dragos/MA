// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view.dart';
import 'person_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonViewModel(),
      child: MaterialApp(
        home: PersonView(),
      ),
    );
  }
}
