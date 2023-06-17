import 'package:flutter/material.dart';
// import 'package:it_support/authorization/sign_in/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zumait/screens/admin_panel.dart';
import 'package:zumait/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBcr-omX2rAmbsV2yn2T9E0aRvYlbifD4k",
      appId: "1:813776672115:web:bb20383b5f6b98516f2106",
      messagingSenderId: "813776672115",
      projectId: "zuma-c6eee",
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
      home:HomePage(),
    );
  }
}
