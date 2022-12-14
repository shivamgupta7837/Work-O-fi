import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workofi/screens/pendingTasks.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const PendingTasks())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8963ff),
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
