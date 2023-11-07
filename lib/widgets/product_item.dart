import 'package:flutter/material.dart';
import 'package:myshop/providers/card_provider.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/screens/details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product productName = Provider.of<Product>(context);
    CardProvider cardProvider =
        Provider.of<CardProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: productName.isFav ? Colors.red : Colors.white,
            ),
            onPressed: () => productName.changeFavStatus(),
          ),
          title: Text(
            productName.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cardProvider.add(
                  id: productName.id,
                  price: productName.price,
                  title: productName.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item has been added successfully'),
                  action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.red,
                      onPressed: () {
                        cardProvider.removeItem(productName.id);
                      }),
                  duration: const Duration(seconds: 30),
                ),
              );
            },
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Details.routeName, arguments: productName.id);
          },
          child: Image.network(
            productName.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
