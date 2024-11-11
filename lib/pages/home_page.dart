import 'package:contact_app/pages/add_contact_page.dart';
import 'package:contact_app/pages/contacts_page.dart';
import 'package:contact_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Student Contacts'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn3d.iconscout.com/3d/premium/thumb/contact-3d-icon-download-in-png-blend-fbx-gltf-file-formats--call-logo-support-chat-ui-pack-mobile-interface-icons-7139046.png",
                width: 300,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Text('Failed to load image', style: TextStyle(color: Colors.red));
                },
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => Get.to(() => AddContactPage()),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primaryTextColor),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  minimumSize: WidgetStateProperty.all(const Size(250, 50)),
                  elevation: WidgetStateProperty.all(10),
                ),
                child: Text('Add Student', style: GoogleFonts.aboreto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()=> Get.to(() => Contacts()),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primaryColor),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  minimumSize: WidgetStateProperty.all(const Size(250, 50)),
                  elevation: WidgetStateProperty.all(10),
                ),
                child: Text('View Students', style: GoogleFonts.aboreto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ],
          )
        ));
  }
}
