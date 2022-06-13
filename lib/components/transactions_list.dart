import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'não tem nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              //O map recebe uma função de callback(ou seja tem que ter retorno) como parâmetro e para cada instanciação ele roda essa função
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
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
              },
            ),
    );
  }
}
