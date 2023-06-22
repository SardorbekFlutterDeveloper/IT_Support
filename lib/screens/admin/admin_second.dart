import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminSecond extends StatefulWidget {
  const AdminSecond({super.key});

  @override
  State<AdminSecond> createState() => _AdminFirstState();
}

class _AdminFirstState extends State<AdminSecond> {
  final Stream request =
      FirebaseFirestore.instance.collection("request").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: StreamBuilder(
          stream: request,
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
                  flex: 2,
                  child: Table(
                    textDirection: TextDirection.ltr,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(width: 1.0, color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " ",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Department",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Employee code",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Required of priuillage",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Reason for request",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Table(
                        textDirection: TextDirection.ltr,
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.bottom,
                        border: TableBorder.all(width: 1.0, color: Colors.grey),
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("     ${index + 1}",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "     ${data.docs[index]['department'].toString()}",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "    ${data.docs[index]['employee'].toString()}",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "     ${data.docs[index]['requirement'].toString()},",
                                    style: TextStyle(fontSize: 20)),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "     ${data.docs[index]['reason'].toString()},",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                        ],
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
