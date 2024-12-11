## ✔️ GetX - Flutter Expense Tracker (CRUD) [📂 (source)](https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/lib/controller/helper/db_helper.dart)

## Overview
A Flutter application that manages financial records using the **sqflite** and **getx** packages. The application includes functionalities to perform CRUD operations, filter records, and calculate financial statistics such as total balance, profit, and expenses.

---

## Features
- **Create Records:** Insert records with the current date, amount, income/expense type, and category.
- **Read Records:** Fetch all records or filter them based on specific criteria.
- **Update Records:** Modify existing records.
- **Delete Records:** Remove specific records from the database.
- **Calculate Totals:** Compute total balance, profit, and expenses dynamically.

---

## Packages Used
- [get](https://pub.dev/packages/get): For state management and navigation.
- [sqflite](https://pub.dev/packages/sqflite): For local SQLite database management.

---

## Setup Instructions

### Prerequisites
Ensure you have the following installed:
- Flutter SDK
- Dart
- An IDE (e.g., Android Studio, Visual Studio Code)

## Features in Detail

### Create Record
- **Fields:**
  - `date`: Automatically set to the current date.
  - `amount`: User input.
  - `isIncome`: Boolean (true for income, false for expense).
  - `category`: User-selected category.
- **Example:**
```dart
RecordController.insertRecord(
  amount: 1000,
  isIncome: true,
  category: 'Salary',
);
```

### Read Records
- Fetch all records or filtered records by date, category, or income/expense type.
- **Example:**
```dart
List<Record> records = await RecordController.fetchRecords();
```

### Update Record
- Modify any field of an existing record.
- **Example:**
```dart
RecordController.updateRecord(
  id: 1,
  amount: 1200,
  category: 'Freelance',
);
```

### Delete Record
- Remove a specific record by its `id`.
- **Example:**
```dart
RecordController.deleteRecord(id: 1);
```

### Calculate Totals
- **Balance:** Total income - total expenses.
- **Profit:** Sum of all income.
- **Expense:** Sum of all expenses.
- **Example:**
```dart
int balance = RecordController.calculateBalance();
int profit = RecordController.calculateProfit();
int expense = RecordController.calculateExpense();
```

### Screenshots 📷

<div align="left">
   
<img src= "https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/snaps/snap1-portrait.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
<img src= "https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/snaps/snap2-portrait.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
<img src= "https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/snaps/snap3-portrait.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
<img src= "https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/snaps/snap4-portrait.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
<img src= "https://github.com/Zimil-Patel/sqlite_database_tasks/blob/master/snaps/snap5-portrait.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;

</div>

### Video Preview 🎥


https://github.com/user-attachments/assets/8327a40a-15b8-4c29-a522-ec3a1a1b0d45


