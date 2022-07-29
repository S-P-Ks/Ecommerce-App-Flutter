import 'package:ecommapp/controllers/login_controller.dart';
import 'package:ecommapp/controllers/signup_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  void dependencies() {
    Get.put(LoginController());
  }
}
