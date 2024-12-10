class ExpenseModel {
  final int id;
  final double amount;
  final String category, date;
  final bool isIncome;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.isIncome,
  });

  factory ExpenseModel.fromDb(Map map) => ExpenseModel(
        id: map['id'],
        amount: map['amount'],
        category: map['category'],
        date: map['date'],
        isIncome: map['isIncome'] == 1 ? true : false,
      );
}
