class ToDo {
  int id;
  String? task;
  bool isComplete;

  ToDo({required this.id, this.task, this.isComplete = false});

  static List<ToDo> todoFromList() {
    return [
    ];
  }
}
