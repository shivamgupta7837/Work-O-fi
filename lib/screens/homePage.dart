// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workofi/screens/search_task.dart';

import 'add-task.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  
  int _selectedIndex=0;

 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          const IconButton(
              onPressed: null,
              icon: Icon(Icons.settings, color: Color(0xffff4a4a), size: 35)),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02)
        ],
      ),
      floatingActionButton: addTasksButton(context),
      bottomNavigationBar: bottomNavigationBar(),
      backgroundColor: Colors.white,
      // body: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot){
      //       return Center(

      //       )t
      //   }),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        UserName(date: date),
            SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
               const   Align(
                  alignment: Alignment.center,
                   child: Text("Your Tasks",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          )),
                 ),
      ]),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt_outlined),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Search Task',
        ),
      ],
       currentIndex:_selectedIndex,
      selectedItemColor: const Color(0xff8963ff),
      onTap: _onItemTapped,
    );
  }

  FloatingActionButton addTasksButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF8963ff),
      splashColor: Colors.deepPurpleAccent[100],
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => AddTasks()));
      },
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 0, left: 20),
        child: Column(
          children: [
            const Text(
              "Hello",
              style: TextStyle(
                  color: Color(0xff8963ff),
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
            const Text("Jasson",
                style: TextStyle(
                    color: Color(0xff8963ff),
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    height: 0.8)),
            Text(
              "${date.month}.${date.day}.${date.year}",
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  height: 1),
            ),
            
          ],
        ));
  }
}
