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

  Todo(String userId, String title, String memo, int priority, TodoStatus status, DateTime deadlineAt) {
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
