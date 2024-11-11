import 'package:contact_app/models/contact.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactController extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  RxList<Contact> contacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  // Fetch contacts from Firebase
  void fetchContacts() {
    _databaseReference.child('contacts').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      contacts.clear();
      if (data != null) {
        data.forEach((key, value) {
          contacts.add(Contact.fromMap(key, value));
        });
      }
    });
  }

  // Add a new contact to Firebase
  Future<void> addContact(Contact contact) async {
    String key = _databaseReference.child('contacts').push().key!;
    await _databaseReference.child('contacts/$key').set(contact.toMap());
  }

  // Update an existing contact in Firebase
  Future<void> updateContact(Contact contact) async {
    await _databaseReference.child('contacts/${contact.id}').update(contact.toMap());
  }

  // Delete a contact from Firebase
  Future<void> deleteContact(String id) async {
    await _databaseReference.child('contacts/$id').remove();
  }
}
