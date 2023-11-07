import 'package:flutter/material.dart';
import 'package:myshop/screens/businesssuit.dart';
import 'package:myshop/screens/order_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Navigation'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: Row(
            children: [
              const Icon(Icons.home),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Home',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
          child: Row(
            children: [
              const Icon(Icons.shopping_bag),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Order',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BusinessSuitScreen.routeName);
          },
          child: Row(
            children: [
              const Icon(Icons.monitor),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Business Suit',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
