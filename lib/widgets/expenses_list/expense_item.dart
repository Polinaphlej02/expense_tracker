import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4,),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),  // 67.543333 --> 67.54
                const Spacer(), // takes all space between widgets (in Column or Row)
                Row(
                  children: [
                    Icon(Icons. alarm),
                    SizedBox(width: 6,),
                    Text(expense.date.toString())
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}