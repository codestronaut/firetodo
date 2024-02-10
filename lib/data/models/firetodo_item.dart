/// [FireTodoItem] is out main data model for storing and getting the todolist
/// data from and to the Firebase firestore
class FireTodoItem {
  // TODO: 1. Add the properties here.

  FireTodoItem();

  factory FireTodoItem.fromJson(Map<String, dynamic> json) {
    // TODO: 2. Complete the fromJson factory method here.
    return FireTodoItem();
  }

  Map<String, dynamic> toJson() {
    // TODO: 3. Complete the toJson factory method here.
    return {};
  }
}
