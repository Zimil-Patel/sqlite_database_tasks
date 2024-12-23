import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';

class DbHelper {
  // SINGLETON OBJECT
  DbHelper._instance();

  // EXPENSE TABLE
  final String _dbName = 'expense';
  final String _tableName = 'history';
  final String _id = 'id';
  final String _category = 'category';
  final String _amount = 'amount';
  final String _isIncome = 'isIncome';
  final String _date = 'date';
  final String _description = 'description';

  // USER TABLE
  final String _tableUsers = 'users';
  final String _firstName = 'firstName';
  final String _lastName = 'lastName';
  final String _email = 'email';
  final String _password = 'password';
  final String _phoneNumber = 'phoneNumber';
  final String _gender = 'gender';
  final String _age = 'age';
  final String _profilePicture = 'profilePicture';

  static final DbHelper dbHelper = DbHelper._instance();
  Database? _myDb;

  // Future<Database> get myDb async => _myDb ?? await createDatabase();

  Future<Database> get myDb async {
    if (_myDb != null) {
      log('Using existing database instance');
      return _myDb!;
    }
    log('Creating new database instance');
    _myDb = await createDatabase();
    return _myDb!;
  }

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
    final db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        log("Data base is now open....");
        final query1 = '''CREATE TABLE $_tableName(
            $_id INTEGER PRIMARY KEY AUTOINCREMENT,
            $_amount REAL NOT NULL,
            $_category TEXT,
            $_description TEXT,
            $_isIncome INTEGER,
            $_date TEXT
          )''';

        try {
          await db.execute(query1);
          log("Tabled created... : $_tableName");
        } catch (e) {
          log("Failed to create table!!! : $e");
        }

        final query2 = '''CREATE TABLE $_tableUsers(
          $_id INTEGER PRIMARY KEY AUTOINCREMENT,
          $_firstName TEXT,
          $_lastName TEXT,
          $_email TEXT,
          $_password TEXT,
          $_phoneNumber TEXT,
          $_gender TEXT,
          $_age INTEGER,
          $_profilePicture BLOB
        )''';

        try {
          await db.execute(query2);
          log("Tabled created... : $_tableUsers");
        } catch (e) {
          log("Failed to create table!!! : $e");
        }
      },
    );

    return db;
  }

  // INSERT RECORD IN DATABASE
  Future<void> dbInsertRecord(ExpenseModel expenseModel) async {
    Database db = await myDb;
    int isIncome = expenseModel.isIncome ? 1 : 0;
    List args = [
      expenseModel.amount,
      expenseModel.category,
      expenseModel.description,
      isIncome,
      expenseModel.date
    ];

    String query = '''INSERT INTO $_tableName
    ($_amount, $_category, $_description, $_isIncome, $_date)
    VALUES (?,?,?,?,?)
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
      log("Delete status: $result");
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
      // log("Fetch status: $result");
      return result;
    } catch (e) {
      log("Failed to fetch from table: $e");
    }

    return [];
  }

  // UPDATE RECORD
  Future<void> dbUpdateRecord(ExpenseModel expenseModel) async {
    Database db = await myDb;
    int isIncome = expenseModel.isIncome ? 1 : 0;
    log("Expense id: ${expenseModel.id}");
    List args = [
      expenseModel.amount,
      expenseModel.category,
      expenseModel.description,
      isIncome,
      expenseModel.date,
    ];

    final String query = '''UPDATE $_tableName SET $_amount = ?, 
    $_category = ?, 
    $_description = ?,
    $_isIncome = ?, 
    $_date = ? 
    WHERE $_id =  ${expenseModel.id}''';

    try {
      final result = await db.rawUpdate(query, args);
      log("Update status : $result");
    } catch (e) {
      log("Failed to update in table!!! : $e");
    }
  }

  // FILTER BY CATEGORY
  Future<List<Map<String, Object?>>> dbFetchByFilter(int isIncome) async {
    Database db = await myDb;

    String query = '''SELECT * FROM $_tableName WHERE $_isIncome = $isIncome''';

    try {
      final result = await db.rawQuery(query);
      log("Fetch status for $isIncome: $result");
      return result;
    } catch (e) {
      log("Failed to fetch from table for $isIncome: $e");
    }

    return [];
  }

  // FILTER BY SEARCH
  Future<List<Map<String, Object?>>> dbFetchBySearch(String searchValue) async {
    Database db = await myDb;

    String query =
        "SELECT * FROM $_tableName WHERE $_category LIKE '$searchValue%' OR $_description LIKE '%$searchValue%'";

    try {
      final result = await db.rawQuery(query);
      log("Fetch status for $searchValue : $result");
      return result;
    } catch (e) {
      log("Failed to fetch from table for $searchValue : $e");
    }

    return [];
  }

  // FILTER BY SEARCH
  Future<List<Map<String, Object?>>> dbFetchByCategory(String searchValue) async {
    Database db = await myDb;

    String query =
        "SELECT * FROM $_tableName WHERE $_category LIKE '$searchValue'";

    try {
      final result = await db.rawQuery(query);
      log("Fetch status for $searchValue : $result");
      return result;
    } catch (e) {
      log("Failed to fetch from table for $searchValue : $e");
    }

    return [];
  }
}
