import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
