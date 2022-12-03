import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:workofi/screens/homePage.dart';

// import '../Login-Services/signIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8963ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  SizedBox(height: 80),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Work-o-Fi",
                style: GoogleFonts.raleway(fontSize: 32,fontWeight:FontWeight.bold,color: Colors.white)
              ),
            ),
             Text('Organize your work Smartly',
                style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white54)),
          ]),
    );
  }
}
