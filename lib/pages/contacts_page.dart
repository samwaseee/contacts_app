import 'package:contact_app/controllers/contact_controllers.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/pages/add_contact_page.dart';
import 'package:contact_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void _confirmDelete(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete ${contact.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                contactController.deleteContact(contact.id);
                Navigator.of(context).pop(); // Close the dialog
                Fluttertoast.showToast(
                  msg: "${contact.name} has been deleted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                );
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactPage()),
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (contactController.contacts.isEmpty) {
          return Center(child: Text('No contacts found.'));
        }

        return ListView.builder(
          itemCount: contactController.contacts.length,
          itemBuilder: (context, index) {
            final Contact contact = contactController.contacts[index];

            // Debugging: Print name for each contact
            // print("Contact Name: ${contact.name}");

            return ExpansionTile(
              title: Text(contact.name),
              subtitle: Text('Phone: ${contact.phone}'),
              leading: CircleAvatar(
                child: Text(contact.name.isNotEmpty ? contact.name[0] : '?'),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.phone, color: secondaryColor, size: 30),
                    onPressed: () => _makePhoneCall(contact.phone),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_forever_outlined, color: errorColor),
                    onPressed: () => _confirmDelete(context, contact),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${contact.email}'),
                      SizedBox(height: 4),
                      Text('Address: ${contact.address}'),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.edit, color: Colors.white),
                          label: Text('Edit', style: TextStyle(fontSize: 16,color: Colors.white)),
                          style: ElevatedButton.styleFrom(backgroundColor: primaryColor, elevation: 4),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddContactPage(contact: contact),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }),

    );
  }
}
