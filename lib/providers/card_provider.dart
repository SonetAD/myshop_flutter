import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  Map<String, CardItem> _items = {};

  Map<String, CardItem> get item {
    return {..._items};
  }

  List get itemList {
    List itemList = [];

    _items.forEach((key, item) {
      itemList.add(item);
    });
    return itemList;
  }

  int get count {
    int count = 0;
    for (CardItem val in _items.values) {
      if (val.quantity > 0) {
        count += val.quantity;
      }
    }
    return count;
  }

  double get total {
    double total = 0;
    _items.forEach((_, singleProduct) {
      total += singleProduct.price * singleProduct.quantity;
    });
    return total;
  }

  void add({required String id, required double price, required String title}) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (oldItem) => CardItem(
              id: oldItem.id,
              title: oldItem.title,
              price: oldItem.price,
              quantity: oldItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          id, () => CardItem(id: id, title: title, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void delete(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (oldItem) => CardItem(
              id: oldItem.id,
              title: oldItem.title,
              price: oldItem.price,
              quantity: oldItem.quantity - 1));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}

class CardItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CardItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}
