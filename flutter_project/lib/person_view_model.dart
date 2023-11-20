import 'package:flutter/material.dart';
import 'person_model.dart';

class PersonViewModel extends ChangeNotifier {
  List<Person> persons = [];

  // CRUD operations
  void addPerson(Person person) {
    persons.add(person);
    notifyListeners();
  }

  void updatePerson(Person oldPerson, String newName, DateTime newBirthday, String newContact, String newGiftList, String newBirthdayMessage) {
    final index = persons.indexOf(oldPerson);

    if (index != -1) {
      // Update the person with new information
      persons[index] = Person(
        name: newName,
        birthday: newBirthday,
        contact: newContact,
        giftList: [newGiftList],
        birthdayMessage: newBirthdayMessage
      );

      notifyListeners();
    }
  }

  void removePerson(Person person) {
    persons.remove(person);
    notifyListeners();
  }

// Additional methods for fetching or processing data

// You can also implement methods to interact with your data source (e.g., API, database)
}
