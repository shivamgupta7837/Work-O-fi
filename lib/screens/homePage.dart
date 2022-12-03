import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workofi/screens/pendingTasks.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLightTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Your Tasks",
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),

        ),
        backgroundColor: Colors.white,
        body: PendingTasks(),
    );
  }
}
