// person_update_form_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view_model.dart';

class PersonUpdateFormScreen extends StatefulWidget {
  final Person person;

  PersonUpdateFormScreen({required this.person});

  @override
  _PersonUpdateFormScreenState createState() => _PersonUpdateFormScreenState();
}

class _PersonUpdateFormScreenState extends State<PersonUpdateFormScreen> {
  late TextEditingController _nameController;
  late TextEditingController _birthdayController;
  late TextEditingController _contactController;
  late TextEditingController _giftListController;
  late TextEditingController _birthdayMessageController;


  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing values
    _nameController = TextEditingController(text: widget.person.name);
    _birthdayController =
        TextEditingController(text: widget.person.birthday.toString());
    _contactController = TextEditingController(text: widget.person.contact);
    _giftListController = TextEditingController(text: widget.person.giftList.toString());
    _birthdayMessageController = TextEditingController(text: widget.person.birthdayMessage);
  }

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _birthdayController.dispose();
    _contactController.dispose();
    _giftListController.dispose();
    _birthdayMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(labelText: 'Birthday'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(labelText: 'Contact'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _giftListController,
              decoration: InputDecoration(labelText: 'Gift list'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _birthdayMessageController,
              decoration: InputDecoration(labelText: 'Birthday message'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Show confirmation dialog before updating
                showUpdateConfirmationDialog(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  // person_update_form_screen.dart
  Future<void> showUpdateConfirmationDialog(BuildContext context) async {
    String newName = _nameController.text;
    String newBirthday = _birthdayController.text;
    String newContact = _contactController.text;
    String newGiftList = _giftListController.text;
    String newBirthdayMessage = _birthdayMessageController.text;

    if (newName.isEmpty || newBirthday.isEmpty || newContact.isEmpty || newGiftList.isEmpty || newBirthdayMessage.isEmpty) {
      // Display an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    } else {
      // Display confirmation dialog
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Confirmation'),
            content: Text('Are you sure you want to update this person?'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'), // Pop until the main screen
                  ); // Cancel the update
                },
              ),
              TextButton(
                child: Text('Update'),
                onPressed: () {
                  // Update the person and notify the PersonView
                  Provider.of<PersonViewModel>(context, listen: false)
                      .updatePerson(
                    widget.person,
                    _nameController.text,
                    DateTime.parse(_birthdayController.text),
                    _contactController.text,
                    _giftListController.text,
                    _birthdayMessageController.text,
                  );

                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'), // Pop until the main screen
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }
}
