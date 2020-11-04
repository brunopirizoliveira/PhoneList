import 'package:bbank/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbank/screens/contact_form.dart';
import 'package:bbank/database/app_database.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future:
              Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Loading....',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                );
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
                break;
            }

            return Text('Unknown Error');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.fullName,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accounNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
