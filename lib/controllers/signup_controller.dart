import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> singupKey = GlobalKey<FormState>();

  final getStorage = GetStorage();

  late TextEditingController emailController,
      passwordController,
      addressController,
      phoneController,
      usernameController;
  var email = '';
  var password = '';
  var username = "";
  var address = "";
  var phoneNumber;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    addressController.dispose();
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

  String? validateUserName(String value) {
    if (value.length < 4) {
      return "Username must be of 4 characters";
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.length < 10) {
      return "Phone Number must be of 10 characters";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 6) {
      return "Please enter proper address.";
    }
    return null;
  }

  late File img;
  String? imagePath;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      img = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      update();
    } else {
      print('No image selected.');
    }
  }

  var user;

  void checkSignup() async {
    final _auth = FirebaseAuth.instance;
    final isValid = singupKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    singupKey.currentState!.save();
    var authResult;

    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(authResult.user);
      user = authResult.user;
      // print(user);
      String uid = user.uid;
      print(uid);

      await FirebaseFirestore.instance.collection("users").doc(user.uid).set(
        {
          "email": email,
          "username": username,
          "address": address,
          "phoneNumber": phoneNumber,
        },
      );

      getStorage.write("userID", user.uid);
      getStorage.write("username", username);
      getStorage.write("email", email);
      getStorage.write("phoneNumber", phoneNumber);
      getStorage.write("address", address);

      Get.snackbar(
        "Success",
        "Signup Successful",
        snackPosition: SnackPosition.BOTTOM,
      );
      await Future.delayed(Duration(microseconds: 1000));
      Get.toNamed("/");
    } catch (e) {
      Get.snackbar(
        "Error",
        "User already exists.",
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
