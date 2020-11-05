import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbank/models/contact.dart';
import 'package:bbank/database/dao/contact_dao.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();

  final ContactDAO _dao = ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Form',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                ),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                // double.maxFinite - Relativo ao width 100%, precisa estar dentro de um widget SizedBox
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    final String name = _fullNameController.text;
                    final int account = int.tryParse(_accountNumberController.text);

                    final Contact newContact = Contact(fullName: name, accounNumber: account);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
