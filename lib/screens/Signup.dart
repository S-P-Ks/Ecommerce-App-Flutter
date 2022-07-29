import 'dart:io';

import 'package:ecommapp/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/login_controller.dart';

class SignUp extends GetWidget<SignUpController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.singupKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Text(
                    "Sign Up Page",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.usernameController,
                    onSaved: (value) {
                      controller.username = value!;
                    },
                    validator: (value) {
                      return controller.validateUserName(value!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.phoneController,
                    onSaved: (value) {
                      controller.phoneNumber = value!;
                    },
                    validator: (value) {
                      return controller.validatePhoneNumber(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Address",
                      prefixIcon: Icon(Icons.home),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.addressController,
                    onSaved: (value) {
                      controller.address = value!;
                    },
                    validator: (value) {
                      return controller.validateAddress(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.checkSignup();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    child: const Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
