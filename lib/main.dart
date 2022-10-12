import 'package:flutter/material.dart';
import 'package:workofi/Screens/splash_screen.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';

 main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  //we are initialize firebase by using this  method and it will initialize new instance and return it to app 
  // await Firebase.initializeApp();
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
        primarySwatch: Colors.purple,
      ),
      home:  SplashScreen()
    );
  }
}