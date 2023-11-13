import 'package:flutter/material.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:myshop/screens/modifyproduct_screen.dart';
import 'package:provider/provider.dart';

class SingleBusinessItem extends StatelessWidget {
  final int index;
  final String title;
  final String url;
  final double price;
  final String description;

  const SingleBusinessItem({
    required this.index,
    required this.title,
    required this.url,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    ProductData productData = Provider.of<ProductData>(context);
    return ListTile(
      key: ValueKey(index),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Text(title),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(ModifyProductScreen.routeName, arguments: {
              'appBarTitle': 'Edit Product',
              'data': {
                'index': index,
                'title': title,
                'price': price,
                'description': description,
                'url': url,
              }
            });
          },
          icon: const Icon(
            Icons.edit,
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to delete this product?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            productData.remove(index);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Delete'))
                    ],
                  );
                });
          },
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ]),
    );
  }
}
