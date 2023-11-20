// person_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view_model.dart';
import 'person_update_form_screen.dart';

class PersonDetailScreen extends StatelessWidget {
  final Person person;

  PersonDetailScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(person.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Birthday: ${person.birthday.toString()}'),
                Text('Contact: ${person.contact}'),
                Text('Contact: ${person.giftList}'),
                Text('Contact: ${person.birthdayMessage}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to update form screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonUpdateFormScreen(person: person),
                      ),
                    );
                  },
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Show confirmation dialog before deleting
                    bool deleteConfirmed = (await showDeleteConfirmationDialog(context)) as bool;
                    if (deleteConfirmed) {
                      // Delete the person and notify the PersonView
                      Provider.of<PersonViewModel>(context, listen: false)
                          .removePerson(person);
                      Navigator.pop(context); // Go back to the previous screen
                    }
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete this person?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the delete
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the delete
              },
            ),
          ],
        );
      },
    );
  }
}
