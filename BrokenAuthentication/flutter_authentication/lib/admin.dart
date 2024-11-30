import 'package:flutter/material.dart';
import 'package:flutter_authentication/api_handler.dart';
import 'package:flutter_authentication/model.dart';
import 'package:flutter_authentication/privateInfo.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final formKey = GlobalKey<FormBuilderState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  ApiHandler apiHandler = ApiHandler();
  late List<User> data;

  @override
  void initState(){
    super.initState();
    loadData();
  }
  Future<void> loadData() async{
    try{
      List<User> fetchList = await getList();
      setState(() {
        data = fetchList;
      });
    } catch(e){
      print("Error loading data: $e");
    }
  }

  Future<List<User>> getList() async{
    return apiHandler.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () async{
          for(final user in data){
            if ((user.username == nameController.text) && (user.password == passwordController.text) && (user.isAdmin == true)){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivateInfoPage()));
            } else{
              showDialog<String>(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Not accessible'),
                  content: const Text('Either your username or password is incorrect, or you do not have admin access'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),)
                  ],
                ),);
                Navigator.pop(context);
            }
          }
          
        },
        color: Colors.blueAccent,
        textColor: Colors.black,
        child: const Text('Login'),),
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