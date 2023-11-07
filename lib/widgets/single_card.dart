import 'package:flutter/material.dart';
import 'package:myshop/providers/card_provider.dart';

class SingleCard extends StatelessWidget {
  final CardItem cardProvider;

  const SingleCard({required this.cardProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            child: Text('\$ ${cardProvider.price}'),
          ),
        ),
        title: Text(
          cardProvider.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: Text(
          '${cardProvider.quantity}x',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
// 