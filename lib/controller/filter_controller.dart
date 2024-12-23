import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../model/expense_model.dart';

class FilterController extends GetxController{

  RxInt selectedCategory = 0.obs;
  RxList<ExpenseModel> categoryList = <ExpenseModel>[].obs;

  Future<void> fetchRecordByCategory(String searchValue) async {
    final result = await DbHelper.dbHelper.dbFetchByCategory(searchValue);
    categoryList.value = result.map((e) => ExpenseModel.fromDb(e)).toList();
  }

  void setSelectedCategory(int value){
    selectedCategory.value = value;
    String searchValue = expenseCategories[value]['name'];
    fetchRecordByCategory(searchValue);
  }
}