import 'package:contact_app/controllers/contact_controllers.dart';
import 'package:contact_app/pages/contacts_page.dart';
import 'package:contact_app/pages/home_page.dart';
import 'package:contact_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  Get.put(ContactController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contacts App',
      theme: appTheme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
