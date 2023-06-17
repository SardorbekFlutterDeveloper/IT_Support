import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:vtable/vtable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final Stream users =
      FirebaseFirestore.instance.collection("users").snapshots();

  var excel = Excel.createExcel(); //create an excel sheet
  Sheet sheetObject = excel['SheetName'];
   var cell = sheetObject.cell(CellIndex.indexByString("A1"));
 cell.value = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Departments' Problems Ticket",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 33)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.cyan,
              Colors.lightBlue,
              Colors.blue,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
        ),
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
                              "Problem",
                              textScaleFactor: 1.5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
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
                  flex: 9,
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
                                    "     ${data.docs[index]['bolim'].toString()}",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "    ${data.docs[index]['message'].toString()}",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "     ${data.docs[index]['name'].toString()},",
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
