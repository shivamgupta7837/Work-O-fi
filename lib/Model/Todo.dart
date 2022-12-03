class ToDo {
  int id;
  String? task;
  bool isComplete;

  ToDo({required this.id, this.task, this.isComplete = false});

  static List<ToDo> todoFromList() {
    return [
      ToDo(id: 0, task: "Slide left for mark task completed"),
      ToDo(id: 1, task: "Slide right for delete the task")
    ];
  }
}
