import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/Product.dart';
import '../models/productsProvider.dart';

class ProductItemController extends GetxController
    with StateMixin<List<Product>> {
  final ProductsProvider productsProvider;
  User? user;
  var getStorage = GetStorage();
  ProductItemController({required this.productsProvider});

  WishListController wc = Get.find<WishListController>();
  CartController cc = Get.find<CartController>();

  List<dynamic> _products = [].obs;

  List<Product> get getProducts {
    return [..._products];
  }

  @override
  void onInit() {
    getAllProducts();
    print("calling");
    // getUserInfo();
    super.onInit();
  }

  void getAllProducts() async {
    await productsProvider.getProducts().then(
      (value) {
        List<dynamic> pr = value.body!;
        // print(pr);
        // pr.map((e) => print("e"));
        List<Product> p = ProductFromJson(
          json.encode(value.body),
        );
        // print(p);
        _products = [...p];
        wc.addProdustList(_products);
        cc.addProdustList(_products);
        change(getProducts, status: RxStatus.success());
      },
    ).catchError((err) {
      change(
        err,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    });
  }
}
