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
          backgroundColor: const Color(0xff8963ff),
          title: Text(
            "Your Tasks",
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          actions: [
            Switch(
              value: isLightTheme,
              onChanged: (bool value) => setState(() {
                isLightTheme = value;
              }),
              activeColor: const Color(0xff8963ff),
              activeTrackColor: Colors.purple,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02)
          ],
        ),
        backgroundColor: Colors.white,
        body: PendingTasks(),
    );
  }
}
