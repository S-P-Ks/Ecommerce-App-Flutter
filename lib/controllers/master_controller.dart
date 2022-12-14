import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MasterController extends GetxController {
  GetStorage getStorage = GetStorage();

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void pushCart() {
    List<dynamic> cart = getStorage.read("cart");

    print(cart);
  }

  void getUserInfo() async {
    print("called");
    User u = FirebaseAuth.instance.currentUser!;
    print(u.uid);
    String uid = u.uid;
    var userinfo =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    print(userinfo.data());

    var user = userinfo.data();

    String username = user!["username"];

    String phoneNumber = user["phoneNumber"];
    String address = user["address"];
    String email = user["email"];
    String imageUrl = user["imageurl"];
    String intro = user["intro"];
    List<dynamic> wishlist = user["wishlist"];
    List<dynamic> cart = user["cart"];
    List<dynamic> orders = user["orders"];

    getStorage.write("username", username);
    getStorage.write("phoneNumber", phoneNumber);
    getStorage.write("address", address);
    getStorage.write("email", email);
    getStorage.write("imageUrl", imageUrl);
    getStorage.write("intro", intro);
  }
}
