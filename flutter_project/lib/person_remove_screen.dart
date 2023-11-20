// person_remove_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view_model.dart';

class PersonRemoveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personViewModel = Provider.of<PersonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Person'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Perform the remove operation here
            // You may need to pass the person to remove as a parameter
            // personViewModel.removePerson(personToRemove);
            Navigator.pop(context); // Go back to the main screen
          },
          child: Text('Remove Person'),
        ),
      ),
    );
  }
}
