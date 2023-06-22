import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:zumait/screens/users/home_page.dart';

import 'package:zumait/screens/users/second_page.dart';

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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/4.png",
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          labelColor: Color(0xff01e6d1),

                          dividerColor: Color(0xff01e6d1),
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            Tab(
                              child: Text(
                                "Help Desk",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Request Form",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 8,
                child: TabBarView(
                  children: [
                    HomePage(),
                    SecondPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
