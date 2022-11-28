import 'package:flutter/material.dart';

import '../Model/Todo.dart';

class CompleteTasks extends StatefulWidget {
  Todo tasks = Todo();
  @override
  State<CompleteTasks> createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.833,
          child: ListView.builder(
              itemCount: Todo().tasks.length,
              itemBuilder: ((context, index) {
                int newIndex = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 8, right: 15),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    tileColor: const Color.fromARGB(255, 172, 160, 207),
                    title: Text(
                      '${widget.tasks.tasks}',
                      style: const TextStyle(
                          fontSize: 20, decoration: TextDecoration.none),
                    ),
                    leading: CircleAvatar(
                      radius: 15,
                      child: Text("$newIndex"),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }

  //  addCompleteTask() {
  //   var task =  widget.completedTasks;
  //    setState(() {
  //     task;
  //   });

  // }
}
