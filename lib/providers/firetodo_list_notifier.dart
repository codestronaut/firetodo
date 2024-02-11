import 'package:flutter/material.dart';

import '../data/models/models.dart';
import 'firetodo_request_state.dart';

class FireTodoListNotifier extends ChangeNotifier {
  // TODO: 1. Add FireTodoListNotifier implementation

  var _todoList = <FireTodoItem>[];
  List<FireTodoItem> get todoList => _todoList;

  var _todoListState = FireTodoRequestState.initial;
  FireTodoRequestState get todoListState => _todoListState;

  var _todoState = FireTodoRequestState.initial;
  FireTodoRequestState get todoState => _todoState;

  Future<void> getTodoList({required DateTime dateTime}) async {
    // TODO: 2. Add getTodoList implementation
  }

  Future<void> addUpdateTodo(FireTodoItem todo) async {
    // TODO: 3. Add addUpdateTodo implementation
  }

  Future<void> deleteTodo(FireTodoItem todo) async {
    // TODO: 4. Add deleteTodo implementation
  }
}
