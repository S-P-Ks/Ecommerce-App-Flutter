import 'package:ecommapp/controllers/Product_detai_controller.dart';
import 'package:get/get.dart';

import '../controllers/Wishlist_controller.dart';

class ProductDetailsBinding extends Bindings {
  void dependencies() {
    Get.put(ProductDetailController());
  }
}
