// import 'package:ecommapp/Constants/TextWidget.dart';
// import 'package:ecommapp/controllers/cart_controller.dart';
// import 'package:ecommapp/models/Product.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'dart:math';

// class CartItem extends GetWidget<CartController> {
//   int id;
//   CartItem(this.id, {Key? key})
//       : super(
//           key: key,
//         );
//   CartController cc = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     Product p = cc.getProductById(id);

//     String Title = p.title;
//     var total = p.price * p.quantity!;
//     print(total);

//     return Container(
//       key: UniqueKey(),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(color: Colors.white70, width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         elevation: 5,
//         child: Column(
//           children: [
//             ListTile(
//               onTap: () {
//                 Get.toNamed("/shop/${p.id}");
//               },
//               style: ListTileStyle.list,
//               contentPadding: const EdgeInsets.all(10),
//               leading: SizedBox(
//                 width: 100,
//                 height: 100,
//                 child: FittedBox(
//                   child: Image.network(p.image),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               title: Text(
//                 Title.length > 20 ? Title.substring(0, 20) + "..." : Title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontFamily: "Quicksand",
//                 ),
//               ),
//               trailing: IconButton(
//                   onPressed: () {
//                     controller.toggleIcon();
//                   },
//                   icon: Obx(
//                     () => controller.open.value
//                         ? Icon(Icons.arrow_upward)
//                         : Icon(Icons.arrow_downward),
//                   )),
//             ),
//             Container(
//               padding: EdgeInsets.all(15),
//               child: Obx(
//                 () => controller.open.value
//                     ? Container(
//                         child: Column(
//                           children: [
//                             // Obx(
//                             //   () =>
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextWidget.getText(
//                                     "Quantity : ", "Quicksand", 20),
//                                 TextWidget.getText(
//                                     "${p.quantity}", "Quicksand", 20),
//                               ],
//                             ),
//                             // ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             // Obx(
//                             //   () =>
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextWidget.getText(
//                                     "Total Price : ", "Quicksand", 20),
//                                 TextWidget.getText("${p.quantity! * p.price}",
//                                     "Quicksand", 20),
//                               ],
//                             ),
//                             // ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 ElevatedButton(
//                                     onPressed: () {
//                                       cc.decreaseQuantity(p.id);
//                                     },
//                                     child: const Text(
//                                       "-",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     cc.increaseQuantity(p.id);
//                                   },
//                                   child: const Text(
//                                     "+",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     : Container(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommapp/Constants/TextWidget.dart';
import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:ecommapp/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';

class CartItem extends StatefulWidget {
  int id;
  CartItem(this.id, {Key? key})
      : super(
          key: key,
        );

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  CartController cc = Get.find<CartController>();
  bool open = false;

  toogleOpen() {
    setState(() {
      open = !open;
    });
  }

  @override
  Widget build(BuildContext context) {
    Product p = cc.getProductById(widget.id);

    String Title = p.title;
    var total = p.price * p.quantity!;
    print(total);

    return Container(
      key: UniqueKey(),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed("/shop/${p.id}");
              },
              style: ListTileStyle.list,
              contentPadding: const EdgeInsets.all(10),
              leading: SizedBox(
                width: 100,
                height: 100,
                child: FittedBox(
                  child: Image.network(p.image),
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                Title.length > 20 ? Title.substring(0, 20) + "..." : Title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Quicksand",
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  toogleOpen();
                },
                icon: open
                    ? const Icon(Icons.arrow_upward)
                    : const Icon(Icons.arrow_downward),
              ),
            ),
            if (open)
              Container(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      children: [
                        GetBuilder<CartController>(
                          builder: (_c) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget.getText(
                                  "Quantity : ", "Quicksand", 20),
                              TextWidget.getText(
                                  "${p.quantity}", "Quicksand", 20),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<CartController>(
                          builder: (_c) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget.getText(
                                  "Total Price : ", "Quicksand", 20),
                              TextWidget.getText(
                                  "${(p.quantity! * p.price).toStringAsFixed(2)}",
                                  "Quicksand",
                                  20),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  cc.decreaseQuantity(p.id);
                                },
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cc.increaseQuantity(p.id);
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
