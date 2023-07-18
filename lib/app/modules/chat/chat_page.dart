import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.settings),
            )
          ],
          // backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topLeft,
                  colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight),
            ),
          ),
        ),
        body: Container());
  }
}
