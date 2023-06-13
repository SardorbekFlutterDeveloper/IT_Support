import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/admin_panel.dart';

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

  var bolim = '';
  var name = '';
  var message = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
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
                        users
                            .add({
                              "bolim": bolim,
                              "name": name,
                              "message": message
                            })
                            .then((value) => (value) => print("User Added"))
                            .catchError((error) =>
                                print("Failed to add user: ${error}"));
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,  MaterialPageRoute(builder: (context) =>  AdminPage()));
        
      }, child: Text(">>"),),
    );
  }
}
