import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final String titletrip;
  final double value;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.titletrip,
    @required this.value,
    @required this.date,
  });
}