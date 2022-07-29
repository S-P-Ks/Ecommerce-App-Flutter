import 'package:ecommapp/Constants/TextWidget.dart';
import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:ecommapp/widgets/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Added to the cart : ",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Obx(
                  () => controller.getCartListLength > 0
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.getCartListLength,
                          itemBuilder: ((context, index) {
                            final img = controller.getCartItems[index].image;
                            final Title = controller.getCartItems[index].title;
                            final price = controller.getCartItems[index].price;
                            final id = controller.getCartItems[index].id;

                            return Dismissible(
                              onDismissed: (direction) async {
                                controller.remove(id);
                                Get.defaultDialog(
                                  title: "Alert",
                                  titleStyle: const TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                  ),
                                  middleText: "Cart Item has been deleted.",
                                  middleTextStyle: const TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                  ),
                                );
                                await Future.delayed(Duration(seconds: 2));
                                Get.back();
                              },
                              key: ValueKey(id),
                              child: CartItem(
                                id: id,
                              ),
                            );
                          }),
                        )
                      : const Center(
                          child: Text(
                            "No Products added to the Cart.",
                            style: TextStyle(
                              fontFamily: "Quicksand",
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
