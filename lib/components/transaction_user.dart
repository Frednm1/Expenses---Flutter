import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transactions_list.dart';
import './transaction_form.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUser();
}

class _TransactionUser extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 110.60,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo tênis Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 110.60,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo tênis Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 110.60,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo tênis Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 110.60,
      date: DateTime.now(),
    ),
  ];
  _addTransaction(String title, double value) {
    // a função addTransaction requisita os dados que vêm da função onsubmit de TransactionForm
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(
            _addTransaction), //chama a função _addTransaction --- Passagem de parametros indireta
        Container(
          height: 300,
          child: SingleChildScrollView(
            //note que está envolvida por uma div pai para ter seu espaço de exibição delimitado
            child:
                TransactionList(_transactions), //passagem de parametros direta
          ),
        ),
      ],
    );
  }
}
