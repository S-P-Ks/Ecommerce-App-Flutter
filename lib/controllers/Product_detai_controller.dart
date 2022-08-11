import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

import 'Product_Item_controller.dart';

class ProductDetailController extends GetxController with StateMixin<Product> {
  var productList = Get.find<ProductItemController>().getProducts;

  void init() {}

  Product getProductById(int id) {
    Product p = productList.firstWhere((element) {
      // print(element["id"]);
      return element.id == id;
    });
    return p;
  }
}
