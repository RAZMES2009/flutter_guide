import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/orders.dart';
import './providers/auth.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/user_products_screens.dart';
import './screens/edit_product_screen.dart';
import './screens/orders_screens.dart';
import './screens/auth_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(60, 136, 126, 1),
              secondary: const Color.fromRGBO(206, 181, 167, 1),
            ),
            fontFamily: 'Lato'),
        routes: {
          '/': (context) => AuthScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
