import 'package:flutter/material.dart';
import 'package:flutter_authentication/admin.dart';
import 'package:flutter_authentication/api_handler.dart';
import 'package:flutter_authentication/model.dart';
import 'package:flutter_authentication/signUp.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  ApiHandler apiHandler = ApiHandler();
  late List<User> data = [];

  void getData() async{
    data = await apiHandler.getUserData();
    setState(() {});
  }

  @override
  void initState(){
    getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Broken Authentication"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()));
            }, 
            child: const Text('Sign up'),),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPage()));
            }, 
            child: const Text('Admin Access'),),
        ],));
  }
}