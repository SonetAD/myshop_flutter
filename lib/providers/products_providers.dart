import 'package:flutter/material.dart';
import './product.dart';

class ProductData with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      title: 'Shirt',
      description: 'This is an expensive shirt',
      price: 20,
      imgUrl:
          'https://plus.unsplash.com/premium_photo-1682096340835-022e6647b698?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    ),
    Product(
      id: '2',
      title: 'Book',
      description: 'This is a great Book',
      price: 40,
      imgUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
    ),
    Product(
      id: '3',
      title: 'Lamp',
      description: 'This is a very good lamp',
      price: 100,
      imgUrl:
          'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    ),
    Product(
      id: '4',
      title: 'Guiter',
      description: 'This is a great guiter',
      price: 300,
      imgUrl:
          'https://images.unsplash.com/photo-1485278537138-4e8911a13c02?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
    ),
    Product(
      id: '5',
      title: 'Mac',
      description: 'This is the one and only Mac',
      price: 1500,
      imgUrl:
          'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    ),
  ];

  List<Product> get getData {
    return <Product>[..._products];
  }

  void changeData(data) {
    _products = data;
    notifyListeners();
  }

  Product findProduct(String id) {
    return _products.firstWhere((item) => item.id == id);
  }

  void add(
      {required String id,
      required String title,
      required double price,
      required String imgUrl,
      required String description}) {
    _products.add(Product(
        id: id,
        title: title,
        description: description,
        price: price,
        imgUrl: imgUrl));
    notifyListeners();
  }

  void edit({
    required int index,
    required String id,
    required String title,
    required double price,
    required String imgUrl,
    required String description,
  }) {
    _products[index] = Product(
        id: id,
        title: title,
        description: description,
        price: price,
        imgUrl: imgUrl);
    notifyListeners();
  }

  void remove(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}
