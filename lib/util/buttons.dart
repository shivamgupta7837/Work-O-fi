import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:workofi/model/Todo.dart';
import 'package:workofi/util/hiveboxes.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  
  late String tasks;
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xFF8963ff),
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        onPressed: () async {
          _displayTask(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      );
  }

  Future<void> _displayTask(BuildContext context) async {
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
                        onChanged: (value){
                          setState(() {
                            tasks=value;

                          });
                        }
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
                          onPressed: () async {
                            Random random = Random();
                            int randomId = random.nextInt(1000);
                            if (globalFormKey.currentState!.validate()) {
                              addTask(randomId);
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
  
  
  //function for add tasks
    void addTask(int randomId){
    Box<ToDo> todoBox = Hive.box<ToDo>(HiveBoxes.todo);
    setState(() {
    todoBox.add(ToDo(id: randomId, task: tasks));
    });
    Navigator.of(context).pop();

     }
}