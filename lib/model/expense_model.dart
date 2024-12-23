class ExpenseModel {
  final int id;
  final double amount;
  final String category, date;
  String? description;
  final bool isIncome;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.isIncome,
    this.description,
  });

  factory ExpenseModel.fromDb(Map map) => ExpenseModel(
        id: map['id'] ?? 0,
        amount: map['amount'],
        category: map['category'],
        description: map['description'],
        date: map['date'],
        isIncome: map['isIncome'] == 1 ? true : false,
      );
}
