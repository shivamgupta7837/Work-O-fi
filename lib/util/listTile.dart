// import 'package:flutter/material.dart';

// class CustomListTiles extends StatelessWidget {
//    CustomListTiles({super.key,required this.taskList,required this.index});
//    DateTime time =  DateTime.now();
//   List taskList = [];
//   int index;
//     bool isDone=false;
//   @override
//   Widget build(BuildContext context) {
//        int newIndex = index + 1;
//     return ListTile(
//                         trailing: Text("${time.hour}.${time.minute}"),
//                         shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topLeft: Radius.circular(10))),
//                         tileColor: const Color.fromARGB(255, 172, 160, 207),
//                         title: Text(
//                           taskList[index],
//                           style: TextStyle(
//                               fontSize: 20,
//                               decoration: isDone
//                                   ? TextDecoration.lineThrough
//                                   : TextDecoration.none),
//                         ),
//                         leading: CircleAvatar(
//                           radius: 15,
//                           child: Text("$newIndex"),
//                         ),
//                       );
//   }
// }