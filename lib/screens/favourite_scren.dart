import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:myshop/screens/details_screen.dart';
import 'package:myshop/widgets/actions.dart';
import 'package:myshop/widgets/drawer.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static const routename = '/favouritescreen';
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductData>(context)
        .getData
        .where((item) => item.isFav)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        actions: const [PopupButton()],
      ),

      // drawer: const CustomDrawer(),
      body: products.isEmpty
          ? const Center(
              child: Text('No Favourite Item Added'),
            )
          : ListView.builder(
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    Details.routeName,
                                    arguments: products[index].id);
                              },
                              child: Image.network(products[index].imgUrl))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.shop),
                                const SizedBox(width: 5),
                                Text(
                                  products[index].title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.money),
                              const SizedBox(width: 5),
                              Text(
                                '${products[index].price}',
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: products.length,
            ),
    );
  }
}
