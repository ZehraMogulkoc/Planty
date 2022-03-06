import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planty/providers/cart.dart';
import 'package:planty/providers/orders.dart';
import 'package:planty/providers/products.dart';
import 'package:planty/screens/cart_screen.dart';
import 'package:planty/screens/orders_screen.dart';
import 'package:planty/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()
);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
                title: 'Planet Hackathon',
        theme: ThemeData(
          primarySwatch: Colors.green,
          ),

        debugShowCheckedModeBanner: false,
        home: LoginPage(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),


          }
      ),
    );
  }
}
