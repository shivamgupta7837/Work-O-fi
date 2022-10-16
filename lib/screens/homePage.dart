// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xff8963ff),
        centerTitle: true,
        title: Text(
          "Your Tasks",
          style: GoogleFonts.openSans(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: [
          const IconButton(
              onPressed: null, icon: Icon(Icons.settings, color: Colors.white)),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02)
        ],
      ),
      floatingActionButton: _addTasksButton(context),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.833,
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      tileColor: const Color.fromARGB(255, 172, 160, 207),
                      title: Text(
                        taskList[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                })),
          )
        ]),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
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
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xff8963ff),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }

  FloatingActionButton _addTasksButton(BuildContext context) {
    return FloatingActionButton(
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
                            return "Enter Some Task";
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

  void addTask(String task) {
    setState(() {
      taskList.add(task);
    });
  }
}
