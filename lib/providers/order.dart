import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  List<OrderItem> _orderList = [];

  List get orders {
    return [..._orderList];
  }

  void addOrders(List products, double total) {
    _orderList.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            products: products,
            orderTime: DateTime.now()));
    notifyListeners();
  }
}

class OrderItem {
  final String id;
  final double amount;
  final List products;
  final DateTime orderTime;

  const OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.orderTime});
}
