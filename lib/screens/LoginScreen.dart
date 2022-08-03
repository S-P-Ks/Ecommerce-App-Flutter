import 'package:ecommapp/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.loading.value == true
          ? Center(
              child: ListView(
              children: [
                Lottie.asset('assets/loader.json'),
              ],
            ))
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
                width: context.width,
                height: context.height,
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Login Page",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
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
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: context.width),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurpleAccent),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(14)),
                            ),
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            onPressed: () {
                              controller.checkLogin();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/signup");
                          },
                          child: const Text("SignUp"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
