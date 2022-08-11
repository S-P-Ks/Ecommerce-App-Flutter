import 'package:ecommapp/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({Key? key}) : super(key: key);
  static String routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: controller.getOrder.keys.map(
              (e) {
                print(e);
                return Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat.yMMMMEEEEd().format(
                                DateTime.parse(e.split("+")[0]),
                              ),
                              style: const TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      ...controller.getOrder[e].map((a) {
                        print(a);
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            onTap: () {
                              Get.toNamed("/shop/${a.id}");
                            },
                            leading: SizedBox(
                              width: 100,
                              height: 100,
                              child: FittedBox(
                                child: Image.network(a.attributes.image),
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(
                              "${a.attributes.title}",
                              style: const TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 15,
                              ),
                            ),
                            // subtitle: Text(a.price),
                            trailing: Text(
                              "\$${a.attributes.price}",
                              style: const TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 25,
                              ),
                            ),
                          ),
                        );
                      }),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total order Price : \$${e.split("+")[1]}",
                        style: const TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
