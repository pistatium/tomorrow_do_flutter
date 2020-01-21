import 'package:tomorrow_do_flutter/entities/todo.dart';

class FirestoreTodoField {
  static const userId = "user_id";
  static const title = "title";
  static const memo = "memo";
  static const priority = "priority";
  static const status = "status";
  static const createdAt = "created_at";
  static const updatedAt = "updated_at";
  static const deadlineAt = "deadline_at";
}

Map<String, dynamic> todoToFirestoreMap(Todo todo) {
  return {
    FirestoreTodoField.userId: todo.userId,
    FirestoreTodoField.title: todo.title,
    FirestoreTodoField.memo: todo.memo,
    FirestoreTodoField.priority: todo.priority,
    FirestoreTodoField.status: todo.status.toString(),
    FirestoreTodoField.createdAt: todo.createdAt,
    FirestoreTodoField.updatedAt: todo.updatedAt,
    FirestoreTodoField.deadlineAt: todo.deadlineAt,
  };
}

Todo todoFromFirestoreMap(Map<String, dynamic> map) {
  // FIXME
  return Todo();
}