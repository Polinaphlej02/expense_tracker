import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Laptop",
      amount: 20.0,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: "Egypt Tour",
      amount: 700.0,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Ice cream",
      amount: 3.0,
      category: Category.food,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
