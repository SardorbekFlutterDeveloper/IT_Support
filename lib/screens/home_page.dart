import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zumait/screens/admin_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController bController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUsers() {
    return users
        .add({'bolim': bolim, 'name': name, 'message': message})
        .then((value) => print('user Infoemation Added'))
        .catchError((error) => print('Failed to add users: $error'));
  }

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  // DatabaseReference ref = FirebaseDatabase.instance.ref();

  var bolim = '';
  var name = '';
  var message = '';

  @override
  Widget build(BuildContext context) {
    
    // final controller = Get.put();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zuma IT Support",
            style: TextStyle(color: Colors.purple, fontSize: 33)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: bController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.home_work_sharp),
                  hintText: "Write your department?",
                  labelText: "Department",
                ),
                onChanged: (v) {
                  // bController.to = v;
                  bolim = v;
                },
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please enter your department name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Write your full name?",
                  labelText: "name",
                ),
                onChanged: (v) {
                  // nameController.text = v;
                  name = v;
                },
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Write your full name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: mController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.message_sharp),
                  hintText: "What is your message?",
                  hintMaxLines: 2,
                  labelText: "message",
                ),
                onChanged: (v) {
                  // mController.text = v;
                  message = v;
                },
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please enter your message";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Sending Data to IT Departament"),
                          ),
                        );
                        setState(() {
                          addUsers();
                          createUser(
                              bolim: bolim, name: name, message: message);
                        });

                        bController.clear();
                        nameController.clear();
                        mController.clear();
                      }
                    },
                    child: const Text("Submit")),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPage()));
        },
        child: Text(">>"),
      ),
    );
  }

  Future createUser(
      {required String bolim,
      required String name,
      required String message}) async {
    final docUser = FirebaseFirestore.instance.collection("users").doc("my-id");
    final json = {
      "bolim": bolim,
      "name": name,
      "message": message,
    };
  }
}
