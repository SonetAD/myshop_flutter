import 'package:flutter/material.dart';
import 'package:myshop/providers/card_provider.dart';
import 'package:myshop/providers/order.dart';
import 'package:myshop/widgets/single_card.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  static const routeName = '/card';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    Order order = Provider.of<Order>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Card'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Chip(
                  label: Text(
                    '\$ ${cardProvider.total}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
                ElevatedButton(
                  onPressed: () {
                    order.addOrders(cardProvider.itemList, cardProvider.total);
                    cardProvider.clear();
                  },
                  child: const Text('Order'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(cardProvider.itemList[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (_) =>
                    {cardProvider.delete(cardProvider.itemList[index].id)},
                confirmDismiss: (dirrection) {
                  return showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('Do you wanna delete it?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                child: const Text('No')),
                            ElevatedButton(
                                onPressed: () => Navigator.of(ctx).pop(true),
                                child: const Text('Yes')),
                          ],
                        );
                      });
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                child: SingleCard(
                  cardProvider: cardProvider.itemList[index],
                ),
              );
            },
            itemCount: cardProvider.item.length,
          ))
        ],
      ),
    );
  }
}
