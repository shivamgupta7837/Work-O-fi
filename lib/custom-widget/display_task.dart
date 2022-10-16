import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class _DisplayTask extends StatefulWidget {
  const _DisplayTask({
    Key? key,
  }) : super(key: key);

  @override
  State<_DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<_DisplayTask> {
  var taskList = [];

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
  }

    _displayTask(BuildContext context) async{
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
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: taskController,
                        decoration:
                            const InputDecoration(hintText: "Enter Your Task"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('ADD'),
                    onPressed: () {
                      addTask(taskController.text);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
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