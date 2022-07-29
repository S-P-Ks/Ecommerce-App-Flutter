import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var getStorage = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("id") != null) {
      Future.delayed(const Duration(microseconds: 2000), () {
        Get.offAllNamed("/");
      });
    } else {
      Get.offNamed("/auth");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
