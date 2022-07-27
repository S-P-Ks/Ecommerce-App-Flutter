import 'package:get/get.dart';

import 'Product.dart';

class Products extends GetConnect {
  List<Product> products = [];

  List<Product> get getProducts {
    return [...products];
  }

  void fetchProducts() async {
    var products = await get("");
  }
}
