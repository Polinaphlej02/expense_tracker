import 'package:flutter/material.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
    
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: now, initialDate: now);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
             TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text("Title"),
              ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Date"),
                    IconButton(
                      onPressed: () {
                        _datePicker();
                      }, 
                      icon: Icon(Icons.calendar_month))
                  ],
                  
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
                ),
              ElevatedButton(
                 onPressed: () {
                   print(_titleController.text);
                   print(_amountController.text);
                },
                child: const Text("Save"),
                )
            ],
          )
        ],
      ),
      );
  }
}