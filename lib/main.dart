import 'package:flutter/material.dart';
import 'package:workofi/Screens/splash_screen.dart';
import 'package:flutter/services.dart';


 main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.purple
      ),
      home:  SplashScreen()
    );
  }
}