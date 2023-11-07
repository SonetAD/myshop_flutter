import 'package:flutter/material.dart';
import 'package:myshop/providers/order.dart';
import 'package:myshop/widgets/drawer.dart';
import 'package:myshop/widgets/singleorder.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<Order>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Column(
            children: orders.orders.map((order) {
              return SingleOrder(total: order.amount, date: order.orderTime);
            }).toList(),
          );
        },
        itemCount: orders.orders.length,
      ),
    );
  }
}
