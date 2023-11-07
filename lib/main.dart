import 'package:flutter/material.dart';
import 'package:myshop/providers/card_provider.dart';
import 'package:myshop/providers/order.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:myshop/screens/businesssuit.dart';
import 'package:myshop/screens/card_screen.dart';
import 'package:myshop/screens/details_screen.dart';
import 'package:myshop/screens/favourite_scren.dart';
import 'package:myshop/screens/modifyproduct_screen.dart';
import 'package:myshop/screens/order_screen.dart';
import 'package:myshop/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductData(),
        ),
        ChangeNotifierProvider(
          create: (_) => CardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Order(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: {
          '/': (_) => ProductOverviewScreen(),
          Details.routeName: (_) => const Details(),
          FavouriteScreen.routename: (_) => const FavouriteScreen(),
          CardScreen.routeName: (_) => const CardScreen(),
          OrderScreen.routeName: (_) => const OrderScreen(),
          BusinessSuitScreen.routeName: (_) => const BusinessSuitScreen(),
          ModifyProductScreen.routeName: (_) => const ModifyProductScreen(),
        },
      ),
    );
  }
}
