import 'package:flutter/material.dart';
import 'package:myshop/screens/favourite_scren.dart';

enum Filter { fav, all }

class PopupButton extends StatelessWidget {
  const PopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (Filter filter) {
        if (filter == Filter.all) {
          Navigator.of(context).pushReplacementNamed('/');
        } else {
          Navigator.of(context).pushReplacementNamed(FavouriteScreen.routename);
        }
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) {
        return [
          const PopupMenuItem(
            value: Filter.fav,
            child: Text('Favourite'),
          ),
          const PopupMenuItem(
            value: Filter.all,
            child: Text('All Items'),
          )
        ];
      },
    );
  }
}
