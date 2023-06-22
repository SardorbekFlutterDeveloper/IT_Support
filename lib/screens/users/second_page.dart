import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dController = TextEditingController();
  TextEditingController eController = TextEditingController();
  TextEditingController reqController = TextEditingController();
  TextEditingController resController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUsers() {
    return users
        .add({
          'department': department,
          'employee': employee,
          'reason': reason,
          'requirement': requirement
        })
        .then((value) => print('user Infoemation Added'))
        .catchError((error) => print('Failed to add users: $error'));
  }

  CollectionReference users = FirebaseFirestore.instance.collection("request");

  var department = '';
  var employee = '';
  var reason = '';
  var requirement = "";
  var resaon = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 500,
                child: TextFormField(
                  controller: dController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.home_work_sharp, color: Color(0xff01e6d1)),
                    hintText: "Write your department name?",
                    labelText: "Department",
                    hintStyle: TextStyle(color: Color(0xff01e6d1)),
                    labelStyle: TextStyle(color: Color(0xff01e6d1)),
                  ),
                  onChanged: (v) {
                    // bController.to = v;
                    department = v;
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
                  controller: eController,
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
                    employee = v;
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
                  controller: reqController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.message_sharp, color: Color(0xff01e6d1)),
                    hintText: "Requirment of privillage",
                    hintMaxLines: 3,
                    labelText: "Requirment of privillage ",
                    hintStyle: TextStyle(color: Color(0xff01e6d1)),
                    labelStyle: TextStyle(color: Color(0xff01e6d1)),
                  ),
                  onChanged: (v) {
                    // mController.text = v;
                    requirement = v;
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Write nessesary privillage";
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
                  controller: resController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.message_sharp, color: Color(0xff01e6d1)),
                    hintText: " Reason for request",
                    hintMaxLines: 3,
                    labelText: " Reason for request",
                    hintStyle: TextStyle(color: Color(0xff01e6d1)),
                    labelStyle: TextStyle(color: Color(0xff01e6d1)),
                  ),
                  onChanged: (v) {
                    // mController.text = v;
                    reason = v;
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Write reason ";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
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

                      dController.clear();
                      eController.clear();
                      reqController.clear();
                      resController.clear();
                    }
                  },
                  child: const Text("Submit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}
