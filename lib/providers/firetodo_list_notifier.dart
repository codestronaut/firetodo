import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/models/models.dart';
import 'firetodo_request_state.dart';

class FireTodoListNotifier extends ChangeNotifier {
  var _todoList = <FireTodoItem>[];
  List<FireTodoItem> get todoList => _todoList;

  var _todoListState = FireTodoRequestState.initial;
  FireTodoRequestState get todoListState => _todoListState;

  var _todoState = FireTodoRequestState.initial;
  FireTodoRequestState get todoState => _todoState;

  Future<void> getTodoList({required DateTime date}) async {
    _todoListState = FireTodoRequestState.loading;
    notifyListeners();

    try {
      final db = FirebaseFirestore.instance;
      final querySnapshot = await db.collection(date.toString()).get();

      final todoList = querySnapshot.docs.map((docSnapshot) {
        return FireTodoItem.fromJson(docSnapshot.data());
      }).toList();

      _todoListState = FireTodoRequestState.success;
      _todoList = todoList;
      notifyListeners();
    } catch (exception, stackTrace) {
      log(exception.toString());
      log(stackTrace.toString());
      _todoListState = FireTodoRequestState.error;
      notifyListeners();
    }
  }

  Future<void> addUpdateTodo(FireTodoItem todo) async {
    _todoState = FireTodoRequestState.loading;
    notifyListeners();

    try {
      await FirebaseFirestore.instance
          .collection(todo.date.toString())
          .doc(todo.id)
          .set(todo.toJson());
      _todoState = FireTodoRequestState.success;
      notifyListeners();
    } catch (exception, stackTrace) {
      log(exception.toString());
      log(stackTrace.toString());
      _todoState = FireTodoRequestState.error;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(FireTodoItem todo) async {
    _todoState = FireTodoRequestState.loading;
    notifyListeners();

    try {
      await FirebaseFirestore.instance
          .collection(todo.date.toString())
          .doc(todo.id)
          .delete();
      _todoState = FireTodoRequestState.success;
      notifyListeners();
    } catch (exception, stackTrace) {
      log(exception.toString());
      log(stackTrace.toString());
      _todoState = FireTodoRequestState.error;
      notifyListeners();
    }
  }
}
