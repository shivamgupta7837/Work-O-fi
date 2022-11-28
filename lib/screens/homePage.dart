import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';\
import 'package:workofi/screens/completeTask.dart';
import 'package:workofi/screens/pendingTasks.dart';

import '../Model/Todo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLightTheme = false;
  int _selectedIndex = 0;
  Todo todo = new Todo();

  final tabs = [PendingTasks(), CompleteTasks()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
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
              activeColor: Color(0xff8963ff),
              activeTrackColor: Colors.purple,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02)
          ],
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                backgroundColor: const Color(0xFF8963ff),
                splashColor: Colors.deepPurpleAccent[100],
                clipBehavior: Clip.hardEdge,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () => _displayTask(context),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            : null,
        bottomNavigationBar: _bottomNavigationBar(),
        backgroundColor: Colors.white,
        body: tabs[_selectedIndex]);
  }

  void delete(int index) {
    setState(() {
      todo.tasks.removeAt(index);
    });
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.pending_actions_rounded), label: 'Pending Tasks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded), label: 'Completed tasks')
      ],
      currentIndex: _selectedIndex,
      selectedFontSize: 17,
      unselectedFontSize: 15,
      iconSize: 25,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
    );
  }

  _displayTask(BuildContext context) {
    final globalFormKey = GlobalKey<FormState>();
    final taskController = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Add Task",
              style: GoogleFonts.openSans(
                  color: Colors.black, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 30),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Form(
                      key: globalFormKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Task";
                          } else {
                            return null;
                          }
                        },
                        controller: taskController,
                        decoration:
                            const InputDecoration(hintText: "Enter Your Task"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            style: TextStyle(fontSize: 16),
                            'ADD',
                          ),
                          onPressed: () {
                            if (globalFormKey.currentState!.validate()) {
                              addTask(taskController.text);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                        TextButton(
                          child: const Text(
                              style: TextStyle(fontSize: 16), 'CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void addTask(String task) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("taskKey", task);
    setState(() {
      todo.tasks.add(task);
    });
  }
}
