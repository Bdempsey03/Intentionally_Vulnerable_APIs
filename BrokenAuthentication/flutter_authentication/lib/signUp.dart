import 'package:flutter/material.dart';
import 'package:flutter_authentication/api_handler.dart';
import 'package:flutter_authentication/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = "";
  String password = "";
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  ApiHandler apiHandler = ApiHandler();
  final formKey = GlobalKey<FormBuilderState>();
  late List<User> data = [];

  void addUser(String username, String password) async{
    if(formKey.currentState!.saveAndValidate()){
      final data = formKey.currentState!.value;

      final user = User(
        userId: 0,
        username: data['username'],
        password: data['password'],
        isAdmin: data['isAdmin'],
      );
      await apiHandler.addUser(username, password);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }
  void getData() async{
    data = await apiHandler.getUserData();
    setState(() {});
  }

  void setUsername(){
    setState(() {
      username = nameController.text;
    });
  }

  void setPassword() {
    setState(() {
      password = passwordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Sign-up"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () async{
          setUsername();
          setPassword();
          getData();
          apiHandler.addUser(username, password);
          Navigator.pop(context);
        },
        color: Colors.blueAccent,
        textColor: Colors.black,
        child: const Text('Sign-Up'),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'username',
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                ),
                const SizedBox(height: 10,),
                FormBuilderTextField(
                  name: 'password',
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),)
            ],)
        ))
    );
  }
}