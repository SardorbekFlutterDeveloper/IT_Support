import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zumait/authorization/sign_up/sign_up.dart';
import 'package:zumait/screens/admin_panel.dart';

import '../../screens/home_page.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Text("To Sign UP"),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text("Sign In Page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Shahsiy hisobingizga kiriring"),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  label: Text("Email"), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  label: Text("password"), border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            UserCredential user = await auth.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
             if(emailController.text == "sardoruzz98@gmail.com" ){
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  AdminPage()),
                (route) => false);
             } else{
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
             }

          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Siz Ro'yhatdan o'tmagansiz")));
          }
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
