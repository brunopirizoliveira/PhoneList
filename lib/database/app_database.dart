import 'package:bbank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'byteBank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE contacts ('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER'
            ')');
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.fullName;
    contactMap['account_number'] = contact.accounNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> listContact = List();
      for (Map<String, dynamic> map in maps) {
        Contact contact = Contact(
          id: map['id'],
          fullName: map['name'],
          accounNumber: map['account_number'],
        );
        listContact.add(contact);
      }
      return listContact;
    });
  });
}
