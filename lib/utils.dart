import 'package:flutter/material.dart';

const double defPadding = 12;

late double height, width;

final List<Map<String, dynamic>> expenseCategories = [
  {
    'name': 'Food & Dining',
    'icon': Icons.restaurant,
    'color': Colors.orange[100]
  },
  {
    'name': 'Transport',
    'icon': Icons.directions_car,
    'color': Colors.blue[100]
  },
  {
    'name': 'Groceries',
    'icon': Icons.local_grocery_store,
    'color': Colors.green[100]
  },
  {'name': 'Shopping', 'icon': Icons.shopping_bag, 'color': Colors.pink[100]},
  {
    'name': 'Bills & Utilities',
    'icon': Icons.lightbulb,
    'color': Colors.yellow[100]
  },
  {
    'name': 'Health & Fitness',
    'icon': Icons.fitness_center,
    'color': Colors.red[100]
  },
  {'name': 'Entertainment', 'icon': Icons.tv, 'color': Colors.purple[100]},
  {'name': 'Travel', 'icon': Icons.flight, 'color': Colors.teal[100]},
  {'name': 'Education', 'icon': Icons.school, 'color': Colors.indigo[100]},
  {'name': 'Personal Care', 'icon': Icons.spa, 'color': Colors.brown[100]},
  {'name': 'Rent', 'icon': Icons.home, 'color': Colors.cyan[100]},
  {'name': 'Insurance', 'icon': Icons.policy, 'color': Colors.amber[100]},
  {'name': 'Savings', 'icon': Icons.savings, 'color': Colors.lime[100]},
  {
    'name': 'Loans',
    'icon': Icons.attach_money,
    'color': Colors.deepOrange[100]
  },
  {
    'name': 'Investments',
    'icon': Icons.trending_up,
    'color': Colors.lightGreen[100]
  },
  {
    'name': 'Gifts & Donations',
    'icon': Icons.card_giftcard,
    'color': Colors.pink[200]
  },
  {
    'name': 'Childcare',
    'icon': Icons.child_friendly,
    'color': Colors.lightBlue[100]
  },
  {
    'name': 'Subscriptions',
    'icon': Icons.subscriptions,
    'color': Colors.deepPurple[100]
  },
  {'name': 'Taxes', 'icon': Icons.receipt_long, 'color': Colors.blueGrey[100]},
  {'name': 'Other', 'icon': Icons.category, 'color': Colors.grey[100]},
];

final Map iconList = {
  for (var category in expenseCategories)
    category['name'] as String: {
      'color': category['color'],
      'icon': category['icon'],
    }
};
