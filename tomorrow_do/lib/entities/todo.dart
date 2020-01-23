enum TodoStatus {
  Done,
  TodayDo,
  TomorrowDo,
  SomedayDo,
  Deleted,
}

TodoStatus newTodoStatus(String status) {
  switch (status) {
    case "done": return TodoStatus.Done;
    case "today_do": return TodoStatus.TodayDo;
    case "tomorrow_do": return TodoStatus.TomorrowDo;
    case "someday_do": return TodoStatus.SomedayDo;
    case "deleted": return TodoStatus.Deleted;
  }
  return null;
}

String statusToString(TodoStatus status) {
  switch (status) {
    case TodoStatus.Done: return "done";
    case TodoStatus.TodayDo: return "today_do";
    case TodoStatus.TomorrowDo: return "tomorrow_do";
    case TodoStatus.SomedayDo: return "someday_do";
    case TodoStatus.Deleted: return "deleted";
  }
  return "";
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
