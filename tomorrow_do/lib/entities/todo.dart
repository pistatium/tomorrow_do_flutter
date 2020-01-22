enum TodoStatus {
  Done,
  TodayDo,
  TomorrowDo,
  SomedayDo,
  Deleted,
}

class Todo {
  String userId;
  String title;
  String memo;
  int priority;
  TodoStatus status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deadlineAt;

  Todo({this.userId, this.title, this.memo, this.priority, this.status,
      this.createdAt, this.updatedAt, this.deadlineAt});

  Todo.create(String userId, String title, String memo, int priority, TodoStatus status, DateTime deadlineAt) {
    this.userId = userId;
    this.title = title;
    this.memo = memo;
    this.priority = priority;
    this.status = status;
    this.createdAt = DateTime.now();
    this.updatedAt = DateTime.now();
    this.deadlineAt = deadlineAt;
  }
}
