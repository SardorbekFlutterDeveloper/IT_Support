import 'package:flutter/material.dart';
// import 'package:it_support/authorization/sign_in/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/authorization/sign_in/sign_in_page.dart';
import 'package:portfolio/screens/admin_panel.dart';
import 'package:portfolio/screens/home_page.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Support',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
