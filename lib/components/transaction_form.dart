import 'package:flutter/material.dart';
import './transactions_list.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                labelText: 'Valor R\$',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    onSubmit(title, value);
                  },
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
