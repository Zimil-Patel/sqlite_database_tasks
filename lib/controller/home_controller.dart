import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';

class HomeController extends GetxController{

  // INSERT INTO DATABASE
  void insertIntoDatabase({
    required double amt,
    required String category,
    required int isIncome,
    required String date,
  }){
    DbHelper.dbHelper.dbInsert(amt: amt, category: category, isIncome: isIncome, date: date);
  }
}