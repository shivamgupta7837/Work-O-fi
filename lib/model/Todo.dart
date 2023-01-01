// ignore: file_names
import 'package:hive/hive.dart';
part 'Todo.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject{
  @HiveField(0)
   int id;
  @HiveField(1)
  String task;
  @HiveField(2)
   bool isComplete;

  ToDo({required this.id, required this.task,   this.isComplete=false});

    List<dynamic> todoList =[];

}

