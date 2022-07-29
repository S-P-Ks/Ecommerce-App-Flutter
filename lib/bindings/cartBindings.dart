import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  void dependencies() {
    Get.put(CartController());
  }
}
