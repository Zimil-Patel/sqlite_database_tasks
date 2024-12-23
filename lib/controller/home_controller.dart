import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';
import 'package:sqlite_database_tasks/utils.dart';

class HomeController extends GetxController {
  RxList<ExpenseModel> expenseList = <ExpenseModel>[].obs;
  RxDouble balance = 0.0.obs;
  RxDouble expense = 0.0.obs;
  RxDouble income = 0.0.obs;
  RxString filter = "All".obs;
  RxInt isIncome = 1.obs;
  RxInt selectedCat = 0.obs;
  RxInt selectedType = 0.obs;
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtSearch = TextEditingController();

  // @override
  // Future<void> onInit() async {
  //   // await DbHelper.dbHelper.deleteDatabaseFile();
  //
  //   super.onInit();
  // }
  //

  void setSelectedCategory(int value){
    selectedCat.value = value;
  }

  Future<void> _init() async {
    log("home init Start...");
    // await DbHelper.dbHelper.deleteDatabaseFile();
    await DbHelper.dbHelper.myDb;
    await setExpenseList();
    log("home init Complete...");
  }

  HomeController() {
    log("Called constructor...");
    _init();
  }

  // SET IS INCOME SWITCH
  void setIsIncomeSwitch(int value) {
    isIncome.value = value;
  }

  Future<void> setFilter(String value) async {
    filter.value = value;
    setExpenseList();
  }

  // SET EXPENSE LIST BY SELECTED FILTER
  Future<void> setExpenseList() async {
    switch (filter.value) {
      case "All":
        await fetchRecords();
        break;
      case "Income":
        await fetchFilterRecordByIsIncome(true);
        break;
      case "Expense":
        await fetchFilterRecordByIsIncome(false);
        break;
    }
  }

  // INSERT INTO DATABASE
  Future<void> insertRecord(ExpenseModel model) async {
    await DbHelper.dbHelper.dbInsertRecord(model);
    await setExpenseList();
  }

  // DELETE INTO DATABASE
  Future<void> deleteRecord({required int id}) async {
    await DbHelper.dbHelper.dbDeleteRecord(id);
    await setExpenseList();
  }

  // FETCH FROM DATABASE
  Future<void> fetchRecords() async {
    final List listOfRecords = await DbHelper.dbHelper.dbFetchRecord();
    expenseList.value =
        listOfRecords.map((e) => ExpenseModel.fromDb(e)).toList();
    await calculateBalance();
  }

  // UPDATE RECORD
  Future<void> updateRecord(ExpenseModel model) async {
    await DbHelper.dbHelper.dbUpdateRecord(model);
    setExpenseList();
  }

  // FILTER RECORDS
  Future<void> fetchFilterRecordByIsIncome(bool isIncome) async {
    final isIncomeToInt = isIncome ? 1 : 0;
    final List listOfFilterRecords =
        await DbHelper.dbHelper.dbFetchByFilter(isIncomeToInt);
    expenseList.value =
        listOfFilterRecords.map((e) => ExpenseModel.fromDb(e)).toList();
    await calculateBalance();
  }

  // FILTER RECORD BY SEARCH
  Future<void> fetchFilterRecordBySearch(String searchValue) async {
    final List listOfFilterRecords =
        await DbHelper.dbHelper.dbFetchBySearch(searchValue);
    expenseList.value =
        listOfFilterRecords.map((e) => ExpenseModel.fromDb(e)).toList();
  }

  // FILTER RECORD BY SEARCH
  Future<void> fetchFilterRecordByCategory(String searchValue) async {
    final List listOfFilterRecords =
        await DbHelper.dbHelper.dbFetchByCategory(searchValue);
    expenseList.value =
        listOfFilterRecords.map((e) => ExpenseModel.fromDb(e)).toList();
  }

  // CALCULATE BALANCE
  Future<void> calculateBalance() async {
    final resultList = await DbHelper.dbHelper.dbFetchRecord();
    List<ExpenseModel> recordList =
        resultList.map((e) => ExpenseModel.fromDb(e)).toList();
    balance.value = 0;
    expense.value = 0;
    income.value = 0;
    for (var current in recordList) {
      current.isIncome
          ? income.value += current.amount
          : expense.value += current.amount;
    }
    balance.value = income.value - expense.value;
  }

  void resetControllers() {
    txtAmount.clear();
    txtDescription.clear();
    isIncome.value = 1;
    selectedCat.value = 0;
  }

  void setController(ExpenseModel model){
    txtAmount.text = model.amount.toString();
    txtDescription.text = model.description.toString();
    isIncome.value = model.isIncome ? 1 : 0;
    selectedCat.value = expenseCategories.indexWhere((e) => e['name'] == model.category);
  }
}
