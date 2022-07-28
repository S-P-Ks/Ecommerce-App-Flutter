import 'package:ecommapp/screens/OrderScreen.dart';
import 'package:ecommapp/screens/ProductOverView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends GetView {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("Clicked");
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("User Name"),
                ],
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_2_outlined),
            title: Text('Shop'),
            onTap: () {
              Get.toNamed(ProductOverView.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text('Orders'),
            onTap: () {
              Get.toNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bookmark_add_outlined),
            title: Text('Wish List'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
