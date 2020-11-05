import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bbank/database/dao/contact_dao.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'byteBank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.createTableSQL);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}

