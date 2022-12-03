import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:workofi/Model/Todo.dart';

class PendingTasks extends StatefulWidget {
  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  final todo = ToDo.todoFromList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.833,
            child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: ((context, index) {
                  int newIndex = index + 1;
                  return Padding(
                    padding:
                    const EdgeInsets.only(left: 15.0, top: 8, right: 15),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              delete(todo[index].id);
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.purple,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          )
                        ],
                      ),
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              completeTask(todo[index].isComplete, index);
                            },
                            icon: Icons.task_alt,
                            backgroundColor: Colors.purple,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          )
                        ],
                      ),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        tileColor: const Color.fromARGB(255, 172, 160, 207),
                        title: Text(
                          " ${todo[index].task}",
                          style: TextStyle(
                              fontSize: 20,
                              decoration: todo[index].isComplete == false
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough),
                        ),
                        leading: CircleAvatar(
                          radius: 15,
                          child: Text("$newIndex"),
                        ),
                      ),
                    ),
                  );
                })),
          )
        ]),
      ),
    );
  }

  void delete(int id) {
    setState(() {
      todo.removeWhere((item) => item.id == id);
    });
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                child: Column(
                  children: [
                    Form(
                      key: globalFormKey,
                      child: TextFormField(
                        autofocus: true,
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

  void addTask(String newTask) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("taskKey", task);
    setState(() {
      Random random = Random();
      int randomNumber = random.nextInt(1000);
      todo.add(ToDo(id: randomNumber, task: newTask));
    });
  }

  completeTask(bool isComplete, int index) {
    setState(() {
      if (todo[index].isComplete == false) {
        todo[index].isComplete = true;
      }
    });
  }
}
