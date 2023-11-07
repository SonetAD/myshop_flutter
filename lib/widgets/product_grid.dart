import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:provider/provider.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductData>(context).getData;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
      itemCount: products.length,
      padding: const EdgeInsets.all(20),
    );
  }
}
