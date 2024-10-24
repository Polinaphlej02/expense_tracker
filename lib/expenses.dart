import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';
import 'widgets/chart/chart.dart';

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

  void _removeExpense(Expense expense) {
    final expenseInsex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          action: SnackBarAction(label: "Undo", onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseInsex, expense); 
            });
          }),
          content: const Text("Expense deleted")
          ));
  }

  void _openAddOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addNewExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(child: Text("No expenses found."));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses,),
          Expanded(child: mainContent)
          ],
      ) : Row(
       children: [
          Expanded(child: Chart(expenses: _registeredExpenses,)),
          Expanded(child: mainContent)
          ],
      ),
    );
  }
}
