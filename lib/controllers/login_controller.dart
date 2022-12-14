import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final getStorage = GetStorage();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print("Disposing");
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  var user;

  void checkLogin() async {
    final _auth = FirebaseAuth.instance;
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();

    try {
      loading(true);
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = authResult.user;
      // print(user);
      getStorage.write("userID", user.uid);

      await Future.delayed(
          Duration(seconds: 2),
          () => Get.snackbar("Success", "Login Successful",
              snackPosition: SnackPosition.BOTTOM));
      loading(false);
      if (getStorage.read("intro") != null &&
          getStorage.read("intro") == "done") {
        Get.toNamed("/");
      } else {
        Get.toNamed("/intro");
      }
    } catch (e) {
      loading(false);
      print(e);
      Get.snackbar(
        "Error",
        "Someting went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
