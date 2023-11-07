import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.isFav = false,
    required this.imgUrl,
  });

  void changeFavStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
