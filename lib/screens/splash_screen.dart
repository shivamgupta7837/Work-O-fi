import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:workofi/screens/homePage.dart';

import 'Login-Screen/signIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 2950),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/splash.json"),
            const  SizedBox(height: 80),
            Text(
              "Work-o-Fi",
              style: GoogleFonts.raleway(fontSize: 32,fontWeight:FontWeight.bold,color: Colors.purple)
            ),
            const Text('Organize your work Smartly',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black54)),
          ]),
    );
  }
}
