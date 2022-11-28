class Todo{
  static final Todo _singletonObj = Todo._internal();

  factory Todo(){
    return _singletonObj;
  }

  Todo._internal();

  List<String> tasks = [];
}