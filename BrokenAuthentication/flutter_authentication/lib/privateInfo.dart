import 'package:flutter/material.dart';

class PrivateInfoPage extends StatelessWidget {
  const PrivateInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("John Doe: 123 Main Street"),
            const Text("Jane Doe: 456 River Road"),
          ],),));
  }
}