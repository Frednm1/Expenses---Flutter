// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      body: Column(
        // crossAxisAlignment: //como coluna o eixo principal é o vertical
        //     CrossAxisAlignment.start, // o crossAxisAlignment se refere a linha que cruza esse eixo, no caso ao eixo x
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            //O map recebe uma função de callback(ou seja tem que ter retorno) como parâmetro e para cada instanciação ele roda essa função
            children: _transactions.map((tr) {
              //o tr é um parâmetro do tipo de dado Transactions
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      //Containers possuem opções de estilo
                      //Columns e Rows não possuem essas opções
                      //Colunas sempre ocupam toda a altura disponivel e Rows a largura disponivel
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          //decoração de bordas
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}', //INTERPOLAÇÃO
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y')
                              .format(tr.date), //importado do yaml
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
