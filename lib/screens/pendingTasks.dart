import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workofi/model/Todo.dart';
import 'package:workofi/util/buttons.dart';
import 'package:workofi/util/hiveboxes.dart';
import 'package:hive_flutter/hive_flutter.dart';


class PendingTasks extends StatefulWidget {
  const PendingTasks({super.key});

  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8963ff),
        elevation: 0,
        title: Text(
          "Your Tasks",
          style: GoogleFonts.openSans(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),

      ),
      backgroundColor: Colors.white,
      floatingActionButton: const FloatingButton(),
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


  // function to delete the todo
  void delete(Box<ToDo> box, int index) {
    setState(() {
      box.deleteAt(index);
    });
    }

  // fucntion for check task completed or not
  completeTask(ToDo? res,int  index) async {
    setState(() {
      if (res?.isComplete == false) {
        res?.isComplete = true;
      }
    });
    }

}

