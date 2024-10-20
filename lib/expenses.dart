import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
    ),
    Expense(
      title: "PS5",
      amount: 400.0,
      category: Category.leisure,
      date: DateTime.now(),
    )
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addNewExpense: _addExpense,),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        centerTitle: true,
        actions: [IconButton(onPressed: _openAddOverlay, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
