import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTaskButton extends StatefulWidget {
  List taskList = [];

  AddTaskButton({super.key, required this.taskList});

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  @override
  Widget build(BuildContext context) {
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
    ;
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("taskKey", task);
    setState(() {
      widget.taskList.add(task);
    });
  }
}
