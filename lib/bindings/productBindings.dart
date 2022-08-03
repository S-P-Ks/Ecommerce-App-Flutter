import 'package:ecommapp/bindings/wishListBindings.dart';
import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/controllers/Product_detai_controller.dart';
import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:ecommapp/controllers/master_controller.dart';
import 'package:ecommapp/controllers/order_controller.dart';
import 'package:ecommapp/models/productsProvider.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsProvider());
    Get.put(OrderController(), permanent: true);
    Get.put(WishListController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(MasterController());
    Get.put(ProductItemController(productsProvider: Get.find()));
  }
}
