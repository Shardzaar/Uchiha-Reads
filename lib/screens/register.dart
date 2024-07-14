import 'package:flutter/material.dart';
import 'package:uchiha_reads/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration successful')));
    } catch (e) {
       if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email is already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration Failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(fontSize: 34)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Create username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Create password",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.black),
                ),
              ]),
            ),
            TextButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
