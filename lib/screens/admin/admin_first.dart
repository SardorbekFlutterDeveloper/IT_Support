import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_officechart/officechart.dart';
import 'package:excel/excel.dart';


class AdminFirst extends StatefulWidget {
  const AdminFirst({super.key});

  @override
  State<AdminFirst> createState() => _AdminFirstState();
}

class _AdminFirstState extends State<AdminFirst> {
  final Stream users =
      FirebaseFirestore.instance.collection("users").snapshots();
      
void _downloadExcelFile(List<DocumentSnapshot> documents) async {
  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];

  // Write headers
  sheet.appendRow(['Column1', 'Column2', 'Column3']);

  // Write data
  for (final doc in documents) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    sheet.appendRow([data['column1'], data['column2'], data['column3']]);
  }

  // Save Excel file
  final directory = await getExternalStorageDirectory();
  final file = File('${directory!.path}/example.xlsx');
 
final bytes = excel.encode();
await file.writeAsBytes(bytes!);

  // Show a message to the user
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Excel file downloaded successfully!')),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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
