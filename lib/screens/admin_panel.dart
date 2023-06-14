import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final Stream users =
      FirebaseFirestore.instance.collection("users").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Departments' Problems",
            style: TextStyle(color: Colors.purple, fontSize: 33)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: users,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong, "));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading"),
              );
            }
            final data = snapshot.requireData;

            return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "N",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Department",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Problem",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Center(
                            child: Card(
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                     Text("${index + 1}"), 
                                  Text(" ${data.docs[index]['bolim'].toString()}"), 
                                    Text(
                                        "${data.docs[index]['message'].toString()}"),
                                     Text(
                                      " ${data.docs[index]['name'].toString()}",
                                    ), 
                                      
                                  
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: data.size,
                      ),
                    )
                  ],
                );
          }),
    );
  }
}
