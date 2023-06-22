import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:zumait/screens/admin/admin_panel.dart';


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

  var bolim = '';
  var name = '';
  var message = '';

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
         
         
          Positioned(
            bottom: -165,
            // right: -290,
            right: -185,
            child: Image.asset(
              "assets/images/3.png",
              height: 350,
              width: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        controller: bController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.home_work_sharp,
                              color: Color(0xff01e6d1)),
                          hintText: "Write your department name?",
                          labelText: "Department",
                          hintStyle: TextStyle(color: Color(0xff01e6d1)),
                          labelStyle: TextStyle(color: Color(0xff01e6d1)),
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
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.person, color: Color(0xff01e6d1)),
                          hintText: "Write your code?",
                          labelText: "Employee code",
                          hintStyle: TextStyle(color: Color(0xff01e6d1)),
                          labelStyle: TextStyle(color: Color(0xff01e6d1)),
                        ),
                        onChanged: (v) {
                          // nameController.text = v;
                          name = v;
                        },
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Write your code";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        controller: mController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.message_sharp,
                              color: Color(0xff01e6d1)),
                          hintText: "Write about your problem?",
                          hintMaxLines: 3,
                          labelText: "Explain your problem fully",
                          hintStyle: TextStyle(color: Color(0xff01e6d1)),
                          labelStyle: TextStyle(color: Color(0xff01e6d1)),
                        ),
                        onChanged: (v) {
                          // mController.text = v;
                          message = v;
                        },
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Please enter your problem";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ElevatedButton.styleFrom()
                  Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff01e6d1))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sending Data to IT Departament"),
                              ),
                            );
                            setState(() {
                              addUsers();
                            });
          
                            bController.clear();
                            nameController.clear();
                            mController.clear();
                          }
                        },
                        child: const Text("Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            },
            child: Text(" "),
          ),
        ),
      ),
    );
  }
}
