import 'package:contact/db/dbhelper.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactFormPage extends StatefulWidget {
  static const String routeName = '/form_Page';
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _nameController = TextEditingController();
  final _designationController = TextEditingController();
  final _companyController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _webController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        actions: [IconButton(onPressed: _save, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  filled: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Filed must not be empty ';
                }
                if (value.length > 30) {
                  return 'Contact name should not be more than 30 chars long';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _mobileController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  hintText: 'mobile number',
                  filled: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Filed must not be empty ';
                }
                if (value.length > 11) {
                  return 'Contact name should not be more than 11 chars long';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enail',
                  filled: true),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _designationController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Enter your designation',
                  filled: true),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.abc),
                  hintText: 'Enter your address',
                  filled: true),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _webController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'enter your website',
                  filled: true),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      //save data to database
      final contactModel = ContactModel(
        name: _nameController.text,
        mobile: _mobileController.text,
        email: _emailController.text,
        designation: _designationController.text,
        company: _companyController.text,
        address: _addressController.text,
      );
      DbHelper.insertContact(contactModel).catchError((error) {
        print(error.toString());
      }).then((value) => Navigator.pop(context));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _designationController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _webController.dispose();
    super.dispose();
  }
}
