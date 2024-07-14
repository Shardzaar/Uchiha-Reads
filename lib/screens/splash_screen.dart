import "package:flutter/material.dart";
import "package:uchiha_reads/screens/login.dart";
import "dart:async";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }
  
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 191, 117),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/wallhaven-39qjjd_1080x2410.png", width: MediaQuery.of(context).size.width,),
            const SizedBox(height: 10,),
            const CircularProgressIndicator(),
          ]
        ),
      )
    );
  }
}