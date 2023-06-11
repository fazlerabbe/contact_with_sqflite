import 'package:contact/pages/contact_details_page.dart';
import 'package:contact/pages/contact_form_page.dart';
import 'package:flutter/material.dart';

class ContactHomePage extends StatelessWidget {
  static const String routeName = '/';
  const ContactHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("contact List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ContactFormPage.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
