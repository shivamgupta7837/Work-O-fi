import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workofi/model/Todo.dart';
import 'package:workofi/util/hiveboxes.dart';
import 'package:hive_flutter/hive_flutter.dart';


class PendingTasks extends StatefulWidget {
  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {

  late String tasks;
  Box<ToDo>? box2;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8963ff),
        elevation: 0,
        title: Text(
          "Your Tasks",
          style: GoogleFonts.openSans(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),

      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8963ff),
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
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.833,
            child: ValueListenableBuilder(
              valueListenable: Hive.box<ToDo>(HiveBoxes.todo).listenable(),
              builder: (context,Box<ToDo> box, _){
                if(box.values.isEmpty){
                  return  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.coffee,size: 50,color: Colors.purple,),
                        Text("No Task Available",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),)
                      ],
                    ));
                } return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: ((context, index) {
                      ToDo? res = box.getAt(index);
                      int newIndex = index + 1;
                      return Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                        child: Slidable(
                          closeOnScroll: false,
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  delete(box,index);
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
                                  completeTask(res,index);
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
                              "${res?.task}",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: res?.isComplete == false
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough),
                              // )
                            ),
                            leading: CircleAvatar(
                              radius: 15,
                              child: Text("$newIndex"),
                            ),
                          ),
                        ),
                      );
                    }));
              }
            ),
          )
        ]),
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

  void delete(Box<ToDo> box, int index) {
    setState(() {
      box.deleteAt(index);
    });
    }


  completeTask(ToDo? res,int  index) async {
    setState(() {
      if (res?.isComplete == false) {
        res?.isComplete = true;
      }
    });
    }

    void addTask(int randomId){
    Box<ToDo> todoBox = Hive.box<ToDo>(HiveBoxes.todo);
    setState(() {
    todoBox.add(ToDo(id: randomId, task: tasks));
    });
    Navigator.of(context).pop();

     }
}
