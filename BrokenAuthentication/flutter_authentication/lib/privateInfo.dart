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
      body: Column(
          children: [
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: [
                Container(
                  height: 50,
                  child: const Center(child: const Text('Jane Doe - 123 Main Street'))),
                  Container(
                  height: 50,
                  child: const Center(child: const Text('John Doe - 456 Integra Street'))),
                  Container(
                  height: 50,
                  child: const Center(child: const Text('Charlie Daniels - 999 Bravo Street'))),
                  Container(
                  height: 50,
                  child: const Center(child: const Text('Dan Moors - 78 Light Place'))),
                
              ]
            )
          ],),);
  }
}