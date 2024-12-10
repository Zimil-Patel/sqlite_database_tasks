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
    log('Deleting database...');
    var path = await getDatabasesPath();
    var dbPath = join(path, "$_dbName.db");
    await deleteDatabase(dbPath); // Deletes the database file
    log('Database deleted: $dbPath');
  }


  //CREATE DATABASE
  Future<Database> createDatabase() async {
    // GET DATABASE PATH
    var path = await getDatabasesPath();
    final dbPath = join(path, '$_dbName.db');
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
  Future<void> dbInsertRecord({
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


  // DELETE RECORD IN DATABASE
  Future<void> dbDeleteRecord(int id) async {
    Database db = await myDb;

    String query = '''DELETE FROM $_tableName WHERE $_id = $id''';

    try {
      int result = await db.rawDelete(query);
      log("Status of operation : delete from table : $result");
    } catch (e) {
      log("Failed to delete from table: $e");
    }
  }

  // FETCH RECORD IN DATABASE
  Future<List<Map<String, Object?>>> dbFetchRecord() async {
    Database db = await myDb;

    String query = '''SELECT * FROM $_tableName''';

    try {
      final result = await db.rawQuery(query);
      log("Status of operation : fetch from table : $result");
      return result;

    } catch (e) {
      log("Failed to fetch from table: $e");
    }

    return [];
  }
}