import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neon/neon.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                //   SizedBox(height: 20),
                Text(
                  '',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Neon(
                  text: 'Nenhuma Transação Cadastrada!',
                  color: Colors.deepPurple,
                  fontSize: 16,
                  font: NeonFont.Beon,
                  flickeringText: true,
                  flickeringLetters: null,
                  glowingDuration: new Duration(seconds: 1),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                //  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple, width: 0.40),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black87,
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white,),
                        color: Theme
                            .of(context)
                            .errorColor,

                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
