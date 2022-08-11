import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class CustomerChatScreen extends StatelessWidget {
  const CustomerChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Support"),
      ),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/62ec07ff54f06e12d88cf54d/1g9kvug2p',
        visitor: TawkVisitor(
          name: 'Shubham',
          email: 'ayoubamine2a@gmail.com',
        ),
      ),
    );
  }
}
