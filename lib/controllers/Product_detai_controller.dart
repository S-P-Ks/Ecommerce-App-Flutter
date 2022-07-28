import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

import 'Product_Item_controller.dart';

class ProductDetailController extends GetxController with StateMixin<Product> {
  var productList = Get.find<ProductItemController>().getProducts;

  void init() {}

  dynamic getProductById(int id) {
    dynamic p = productList.firstWhere((element) => element.id == id);
    return p;
  }
}
