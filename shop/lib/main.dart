import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth_or_home_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/order_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/product_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/custom_route.dart';

void main() {
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData tema = ThemeData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.uid ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.uid ?? '',
              previous?.items ?? [],
            );
          },
        ),
      ],
      child: MaterialApp(
        theme: tema.copyWith(
            textTheme: tema.textTheme.copyWith(
              labelLarge: const TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 12,
                  overflow: TextOverflow.fade),
            ),
            colorScheme: tema.colorScheme
                .copyWith(
                  primary: Colors.deepPurple,
                  secondary: Colors.deepPurpleAccent,
                )
                .copyWith(
                  background: const Color.fromARGB(255, 176, 219, 126),
                ),
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionsBuilder(),
            })),
        //home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.authOrHomeRoute: (ctx) => const AuthOrHomePage(),
          AppRoutes.productDetailRoute: (ctx) => const ProductDetailPage(),
          AppRoutes.cartRoute: (ctx) => const CartPage(),
          AppRoutes.orderRoute: (ctx) => const OrdersPage(),
          AppRoutes.productsRoute: (ctx) => const ProductPage(),
          AppRoutes.productFormRoute: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
