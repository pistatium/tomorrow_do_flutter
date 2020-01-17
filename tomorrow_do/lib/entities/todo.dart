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
}
