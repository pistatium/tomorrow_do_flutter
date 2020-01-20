import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';


enum TodoStatus {
  Done,
  TodayDo,
  TomorrowDo,
  SomedayDo,
  Deleted,
}

class Todo extends Document<Todo>{
  String userId;
  String title;
  String memo;
  int priority;
  TodoStatus status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deadlineAt;
}
