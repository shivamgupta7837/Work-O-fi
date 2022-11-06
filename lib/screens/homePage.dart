import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workofi/screens/completeTask.dart';
import 'package:workofi/widgets/addTaskButton.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final taskList = [];
  bool isLightTheme = true;
  int _selectedIndex = 0;
  DateTime time = DateTime.now();


  



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
          Switch(value: isLightTheme, onChanged: (bool value)=>setState(() {
            isLightTheme=value;
          }),
          activeColor:Color(0xff8963ff) ,
          activeTrackColor: Colors.purple,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02)
        ],
      ),
      floatingActionButton: _selectedIndex==0 ? AddTaskButton(
        taskList: taskList,
      ):null,
       bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: _selectedIndex==0 ? SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.833,
            child: ListView.builder(
                itemCount: taskList.length,
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
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              // taskComplete(index);
                            },
                            icon: Icons.task_alt_outlined,
                            backgroundColor: Colors.purple,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          )
                        ],
                      ),
                      child: ListTile(
                        trailing: Text("${time.hour}.${time.minute}"),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        tileColor: const Color.fromARGB(255, 172, 160, 207),
                        title: Text(
                          taskList[index],
                          style: const TextStyle(
                              fontSize: 20,
                              decoration:TextDecoration.none),
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
      ): CompleteTasks()
    );
  }

  void delete(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }
  
   BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.pending_actions_rounded), label: 'Pending Tasks'),
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

}
