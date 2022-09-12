import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      top: true,
      child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Text("this is home page",style:TextStyle(fontSize: 20),),
              )
            ],
          )
      ),
    );
  }
}