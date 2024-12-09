import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // SINGLETON OBJECT
  DbHelper._instance();

  final String _dbName = 'expense';
  final String _tableName = 'history';
  final String _id = 'id';
  final String _category = 'category';
  final String _amount = 'amount';
  final String _isIncome = 'isIncome';
  final String _date = 'date';

  static DbHelper dbHelper = DbHelper._instance();
  Database? _myDb;

  Future<Database> get myDb async => _myDb ?? await createDatabase();

  Future<void> deleteDatabaseFile() async {
    var path = await getDatabasesPath();
    var dbPath = join(path, _dbName);
    await deleteDatabase(dbPath); // Deletes the database file
    log('Database deleted: $dbPath');
  }


  //CREATE DATABASE
  Future<Database> createDatabase() async {
    // GET DATABASE PATH
    var path = await getDatabasesPath();
    final dbPath = join(path, _dbName);
    log("Got path: $dbPath");

    // OPEN DATABASE
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        log("Data base is now open....");
        final query = '''CREATE TABLE $_tableName(
            $_id INTEGER PRIMARY KEY AUTOINCREMENT,
            $_amount REAL NOT NULL,
            $_category TEXT,
            $_isIncome INTEGER,
            $_date TEXT
          )''';

        try {
          await db.execute(query);
          log("Tabled created... : $_tableName");
        } catch (e) {
          log("Failed to create table!!! : $e");
        }
      },
    );

    return db;
  }

  // INSERT RECORD IN DATABASE
  Future<void> dbInsert({
    required double amt,
    required String category,
    required int isIncome,
    required String date,
  }) async {
    Database db = await myDb;

    List args = [amt, category, isIncome, date];

    String query = '''INSERT INTO $_tableName
    ($_amount, $_category, $_isIncome, $_date)
    VALUES (?,?,?,?)
    ''';

    try {
      await db.rawInsert(query, args);
      log("Record inserted...");
    } catch (e) {
      log("Failed to insert into table!!! : $e");
    }
  }
}
