// person_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person_model.dart';
import 'person_view_model.dart';
import 'person_add_screen.dart';
import 'person_remove_screen.dart';
import 'person_detail_screen.dart';

class ExpandablePersonCard extends StatelessWidget {
  final Person person;

  ExpandablePersonCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonDetailScreen(person: person),
            ),
          );
        },
        child: Column(
          children: [
            ListTile(
              title: Text(person.name),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personViewModel = Provider.of<PersonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: ListView.builder(
        itemCount: personViewModel.persons.length,
        itemBuilder: (context, index) {
          final person = personViewModel.persons[index];
          return ExpandablePersonCard(person: person);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonAddScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
