import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to the easybuy.",
            body: "Explore the exciting deals and offer.",
            image: Image.network(
              "https://commercerush.com/wp-content/uploads/2021/06/ecommerce-web-development.png",
              // width: 300,
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              imagePadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              bodyTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
              ),
            ),
          ),
          PageViewModel(
            title: "GetDelivered at your doorsteps.",
            body:
                "Order the product at one click and get qucik delivery of the product.",
            image: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Hand_Gesture_-_Holding_a_Phone_Vector.svg/1280px-Hand_Gesture_-_Holding_a_Phone_Vector.svg.png",
              // width: 300,
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              imagePadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              bodyTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
              ),
            ),
          ),
          PageViewModel(
            title: "Explore various products and offers.",
            body: "We have very exciting products at very exciting deals.",
            image: Image.network(
              "https://media.istockphoto.com/vectors/online-order-in-an-online-store-and-contactless-delivery-online-and-vector-id1223254597?b=1&k=20&m=1223254597&s=612x612&w=0&h=FLu84migviFHcBhSSq9N1URzTVzX4zPiBb1VasFR9xk=",
              // width: 300,
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              imagePadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              bodyTextStyle: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
              ),
            ),
          )
        ],
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand",
            fontSize: 20,
          ),
        ),
        onDone: () async {
          String uid = getStorage.read("userID");

          await FirebaseFirestore.instance
              .collection("users")
              .doc(uid)
              .update({"intro": "done"});
          getStorage.write("intro", "done");
          Get.toNamed("/");
        },
        next: const Text("Next",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              fontSize: 20,
            )),
      ),
    );
  }
}
