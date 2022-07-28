import 'dart:convert';

import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:get/get.dart';

import '../models/Product.dart';
import '../models/productsProvider.dart';

class ProductItemController extends GetxController
    with StateMixin<List<Product>> {
  final ProductsProvider productsProvider;

  ProductItemController({required this.productsProvider});

  WishListController wc = Get.find<WishListController>();

  List<dynamic> _products = [].obs;

  List<Product> get getProducts {
    return [..._products];
  }

  @override
  void onInit() {
    getAllProducts();
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
