import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:get/get.dart';

class WishListBinding extends Bindings {
  void dependencies() {
    Get.put(WishListController());
  }
}
