import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';
import 'package:sqlite_database_tasks/model/user_model.dart';

class UserDbHelper {
  // USER TABLE
  final String _id = 'id';
  final String _tableUsers = 'users';
  final String _firstName = 'firstName';
  final String _lastName = 'lastName';
  final String _email = 'email';
  final String _password = 'password';
  final String _phoneNumber = 'phoneNumber';
  final String _gender = 'gender';
  final String _age = 'age';
  final String _profilePicture = 'profilePicture';

  UserDbHelper._instance();

  static UserDbHelper userDbHelper = UserDbHelper._instance();

  // INSERT RECORD
  Future<int> dbInsertRecord(UserModel userModel) async {
    List args = [
      userModel.firstName,
      userModel.lastName,
      userModel.email,
      userModel.password,
      userModel.phoneNumber
    ];

    Database db = await DbHelper.dbHelper.myDb;

    final query =
        '''INSERT INTO $_tableUsers($_firstName, $_lastName, $_email, $_password, $_phoneNumber) VALUES(?,?,?,?,?)''';

    try {
      final result = await db.rawInsert(query, args);
      log("INSERT STATUS INTO $_tableUsers : $result");
      return result;
    } catch (e) {
      log("FAILED INSERT INTO $_tableUsers!!! : $e");
    }

    return 0;
  }

  // FETCH RECORD
  Future<List<Map<String, Object?>>> dbFetchRecord() async {
    Database db = await DbHelper.dbHelper.myDb;

    final query = "SELECT * FROM $_tableUsers";

    try {
      final result = await db.rawQuery(query);
      log("FETCHED USERS...");
      return result;
    } catch (e) {
      log("FAILED TO FETCH FROM $_tableUsers!!! : $e");
    }
    return [];
  }

  // UPDATE RECORD
  Future<void> dbUpdateRecord(UserModel userModel) async {
    Database db = await DbHelper.dbHelper.myDb;
    List args = [
      userModel.firstName,
      userModel.lastName,
      userModel.email,
      userModel.phoneNumber,
      userModel.age,
      userModel.gender,
      userModel.profilePicture,
    ];

    final query = '''UPDATE $_tableUsers SET 
      $_firstName = ?,
      $_lastName = ?,
      $_email = ?,
      $_phoneNumber = ?,
      $_age = ?,
      $_gender = ?,
      $_profilePicture = ?
      WHERE $_id = ?''';

    try{
      final result = await db.rawUpdate(query, args);
      log("UPDATE STATUS: $result");
    } catch(e) {
      log("FAILED TO UPDATE $_tableUsers : $e");
    }
  }
}
