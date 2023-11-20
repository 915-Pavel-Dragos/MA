// person_add_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view_model.dart';
import 'package:intl/intl.dart';

class PersonAddScreen extends StatefulWidget {
  @override
  _PersonAddScreenState createState() => _PersonAddScreenState();
}

class _PersonAddScreenState extends State<PersonAddScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late DateTime _birthday;
  late String _contact;
  late List<String> _giftList = []; // Initialize _giftList
  late String _birthdayMessage = ''; // Initialize _birthdayMessage

  @override
  Widget build(BuildContext context) {
    final personViewModel = Provider.of<PersonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Birthday'),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'Please enter a valid birthday';
                  }
                  return null;
                },
                onSaved: (value) {
                  _birthday = DateTime.parse(value!);
                  // Convert the value to DateTime and assign it to _birthday
                  // Example: _birthday = DateTime.parse(value!);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contact';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contact = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gift list'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a gift';
                  }
                  return null;
                },
                onSaved: (value) {
                  _giftList.add(value!);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Birthday Message'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
                onSaved: (value) {
                  _birthdayMessage = value!;
                },
              ),
              SizedBox(height: 16),


              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Perform the add operation here
                    personViewModel.addPerson(Person(
                      name: _name,
                      birthday: _birthday,
                      contact: _contact,
                      giftList: _giftList,
                      birthdayMessage: _birthdayMessage,
                    ));

                    Navigator.pop(context); // Go back to the main screen
                  }
                },
                child: Text('Add Person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
