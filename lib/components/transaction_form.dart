import 'package:flutter/material.dart';
import './transactions_list.dart';
import '../main.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    _submitForm() {
      final title = titleController.text;
      final value = double.tryParse(valueController.text) ?? 0.0;
      if (title.isEmpty || value <= 0) {
        return;
      }
      onSubmit(title, value);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (value) => _submitForm(),
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
              onSubmitted: (value) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), //somente number funciona somente em android
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
                  onPressed: _submitForm,
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
