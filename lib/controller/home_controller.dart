import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';

class HomeController extends GetxController {

  RxList<ExpenseModel> expenseList = <ExpenseModel>[].obs;

  @override
  Future<void> onInit() async {
    // await DbHelper.dbHelper.deleteDatabaseFile();
    await DbHelper.dbHelper.myDb;
    await fetchRecords();
    super.onInit();
  }

  // INSERT INTO DATABASE
  Future<void> insertRecord({
    required double amt,
    required String category,
    required bool isIncome,
    required String date,
  }) async {

    final isIncomeToInt = isIncome ? 1 : 0;
    await DbHelper.dbHelper.dbInsertRecord(
        amt: amt, category: category, isIncome: isIncomeToInt, date: date);
    await fetchRecords();
  }

  // DELETE INTO DATABASE
  Future<void> deleteRecord({required int id}) async {
    await DbHelper.dbHelper.dbDeleteRecord(id);
    await fetchRecords();
  }

  // FETCH FROM DATABASE
  Future<void> fetchRecords() async {
    final List listOfRecords = await DbHelper.dbHelper.dbFetchRecord();
    expenseList.value = listOfRecords.map((e) => ExpenseModel.fromDb(e)).toList();
  }

  // UPDATE RECORD
  Future<void> updateRecord({
    required int id,
    required double amt,
    required String category,
    required bool isIncome,
    required String date,
  }) async {
    final isIncomeToInt = isIncome ? 1 : 0;
    await DbHelper.dbHelper.dbUpdateRecord(
      id: id,
        amt: amt, category: category, isIncome: isIncomeToInt, date: date);
    await fetchRecords();
  }

  // FILTER RECORDS
  Future<void> fetchFilterRecordByIsIncome(bool isIncome) async {
    final isIncomeToInt = isIncome ? 1 : 0;
    final List listOfFilterRecords = await DbHelper.dbHelper.dbFetchByFilter(isIncomeToInt);
  }
}
