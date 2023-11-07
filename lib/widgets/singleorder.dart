import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleOrder extends StatelessWidget {
  final double total;
  final DateTime date;

  const SingleOrder({required this.total, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('$total'),
        subtitle: Text(DateFormat('dd mm yyyy hh:mm').format(date)),
      ),
    );
  }
}
