import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:myshop/screens/modifyproduct_screen.dart';
import 'package:myshop/widgets/drawer.dart';
import 'package:myshop/widgets/singlebusinessitem.dart';
import 'package:provider/provider.dart';

class BusinessSuitScreen extends StatelessWidget {
  static const routeName = 'businessSuitScreen';
  const BusinessSuitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductData>(context).getData;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Business Suit'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ModifyProductScreen.routeName, arguments: {
                  'appBarTitle': 'Add Product',
                  'data': null,
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              SingleBusinessItem(
                  index: index,
                  title: products[index].title,
                  url: products[index].imgUrl,
                  price: products[index].price,
                  description: products[index].description)
            ],
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
