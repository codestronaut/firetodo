import 'firetodo_priority.dart';
import 'firetodo_status.dart';

/// [FireTodoItem] is out main data model for storing and getting the todolist
/// data from and to the Firebase firestore
class FireTodoItem {
  final String id;
  final String title;
  final FireTodoPriority priority;
  final FireTodoStatus status;
  final String description;
  final DateTime dateTime;

  FireTodoItem({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
    required this.description,
    required this.dateTime,
  });

  factory FireTodoItem.fromJson(Map<String, dynamic> json) {
    return FireTodoItem(
      id: json['id'] as String,
      title: json['title'] as String,
      priority: FireTodoPriority.fromId(json['priority'] as int),
      status: FireTodoStatus.fromId(json['status'] as int),
      description: json['description'] as String,
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority.id,
      'status': status.id,
      'description': description,
      'dateTime': dateTime.toString(),
    };
  }
}
