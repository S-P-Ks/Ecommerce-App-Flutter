import 'package:ecommapp/bindings/wishListBindings.dart';
import 'package:ecommapp/screens/OrderScreen.dart';
import 'package:ecommapp/screens/ProductDetailScreen.dart';
import 'package:ecommapp/screens/ProductOverView.dart';
import 'package:ecommapp/screens/WishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/productBindings.dart';
import 'bindings/productDetailBinding.dart';
import 'controllers/Wishlist_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ProductBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => ProductOverView(),
          transition: Transition.leftToRight,
          binding: ProductBinding(),
        ),
        GetPage(
          name: "/orders",
          page: () => OrderScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: "/shop/:id",
          page: () => ProductDetailScreen(),
          transition: Transition.leftToRight,
          binding: ProductDetailsBinding(),
        ),
        GetPage(
          name: "/wishlist",
          page: () => WishListScreen(),
          transition: Transition.leftToRight,
          binding: WishListBinding(),
        ),
      ],
      themeMode: ThemeMode.dark,
    );
  }
}
