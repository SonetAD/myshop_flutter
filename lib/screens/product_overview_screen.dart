import 'package:flutter/material.dart';
import 'package:myshop/providers/card_provider.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:myshop/screens/card_screen.dart';
import 'package:myshop/widgets/actions.dart';
import 'package:myshop/widgets/badge.dart';
import 'package:myshop/widgets/drawer.dart';
import 'package:myshop/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      ProductData productData = Provider.of<ProductData>(context);
      productData.fetchData();
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          const PopupButton(),
          Consumer<CardProvider>(
            builder: (_, cardProvider, child) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CardScreen.routeName);
                },
                child: CustomBadge(
                  label: '${cardProvider.count > 0 ? cardProvider.count : ''}',
                  child: const Icon(Icons.shopping_cart),
                ),
              );
            },
          )
        ],
      ),

      // drawer: const CustomDrawer(),

      body: const ProductGrid(),
    );
  }
}
