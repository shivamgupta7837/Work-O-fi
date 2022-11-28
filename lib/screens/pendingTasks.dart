import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:workofi/Model/Todo.dart';

class PendingTasks extends StatefulWidget {
  DateTime time = DateTime.now();
  Todo tasks = Todo();
  final Todo todo = new Todo();

  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  @override
  Widget build(BuildContext context) {
    ;
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.833,
              child: ListView.builder(
                  itemCount: widget.todo.tasks.length,
                  itemBuilder: ((context, index) {
                    int newIndex = index + 1;
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 8, right: 15),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                delete(index);
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.purple,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            )
                          ],
                        ),
                        child: ListTile(
                          trailing:
                          Text("${widget.time.hour}.${widget.time.minute}"),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                          tileColor: const Color.fromARGB(
                              255, 172, 160, 207),
                          title: Text(
                            widget.todo.tasks[index],
                            style: const TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.none),
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
    );
  }

  void delete(int index) {
    setState(() {
      widget.todo.tasks.removeAt(index);
    });
  }
}
