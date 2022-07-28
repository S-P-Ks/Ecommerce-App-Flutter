import 'dart:convert';

import 'package:get/get.dart';

import '../models/Product.dart';
import '../models/productsProvider.dart';

class ProductItemController extends GetxController
    with StateMixin<List<Product>> {
  final ProductsProvider productsProvider;

  ProductItemController({required this.productsProvider});

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
