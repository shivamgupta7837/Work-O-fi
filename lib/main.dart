import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workofi/model/Todo.dart';
import 'package:workofi/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:workofi/util/hiveboxes.dart';


 main() async{
 await Hive.initFlutter();
 Hive.registerAdapter(ToDoAdapter());
 await Hive.openBox<ToDo>(HiveBoxes.todo);
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