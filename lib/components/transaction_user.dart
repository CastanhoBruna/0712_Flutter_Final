// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'transaction_form.dart';
// import 'transaction_list.dart';
// import '../models/transaction.dart';

// class TransactionUser extends StatefulWidget {
//   @override
//   _TransactionUserState createState() => _TransactionUserState();
// }

// class _TransactionUserState extends State<TransactionUser> {

//     final _transactions = [
//       Transaction(
//         id: "t1",
//         title: "nova compra",
//         value: 205.23,
//         date: DateTime.now(),
//          ),
    
    

//     ];

//       _addTransaction(String title, double value) {
//     final newTransaction = Transaction(
//       id: Random().nextDouble().toString(),
//       title: title,
//       value: value,
//       // date: date,
//     );

    
//     setState(() {
//       _transactions.add(newTransaction);
//     });

//     // Navigator.of(context).pop();
//   }

//   // _removeTransaction(String id) {
//   //   setState(() {
//   //     _transactions.removeWhere((tr) => tr.id == id);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TransactionList(_transactions),
//         TransactionForm(_addTransaction),

//       ],
//     );
//   }
// }