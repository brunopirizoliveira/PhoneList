import 'package:bbank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bbank/database/app_database.dart';

class ContactDAO {

  static const String createTableSQL = 'CREATE TABLE contacts ('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER'
      ')';

  static const String _tableName = 'contacts';

  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.fullName;
    contactMap[_accountNumber] = contact.accounNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    final List<Contact> listContact = _toList(result);

    return listContact;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> listContact = List();
    for (Map<String, dynamic> row in result) {
      Contact contact = Contact(
        id: row[_id],
        fullName: row[_name],
        accounNumber: row[_accountNumber],
      );
      listContact.add(contact);
    }

    return listContact;
  }

}

// Future<List<Contact>> findAll() {
// return getDatabase().then((db) {
//   return db.query('contacts').then((maps) {
//     final List<Contact> listContact = List();
//     for (Map<String, dynamic> map in maps) {
//       Contact contact = Contact(
//         id: map['id'],
//         fullName: map['name'],
//         accounNumber: map['account_number'],
//       );
//       listContact.add(contact);
//     }
//     return listContact;
//   });
// });
// }