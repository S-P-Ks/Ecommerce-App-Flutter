import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/models/productsProvider.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsProvider());
    Get.put(ProductItemController(productsProvider: Get.find()));
  }
}
