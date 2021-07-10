class Task {
  String name;
  bool isDone = false;
  int id;
  Task({this.name, this.isDone, this.id});
  void toggleDone() {
    isDone = !isDone;
  }
}
