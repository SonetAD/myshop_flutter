import 'package:flutter/material.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  static const routeName = '/details';
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    var product =
        Provider.of<ProductData>(context, listen: false).findProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text(
              'Price: \$ ${product.price}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$product.description',
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
