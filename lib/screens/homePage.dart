import 'package:flutter/material.dart';
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
        body: PendingTasks(),
    );
  }
}
