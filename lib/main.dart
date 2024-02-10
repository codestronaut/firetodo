import 'package:firetodo/screens/screens.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FireTodoApp());
}

class FireTodoApp extends StatelessWidget {
  const FireTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireTodo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: FireTodoColors.mindfulCream,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: FireTodoColors.mindfulCream,
          surfaceTintColor: FireTodoColors.mindfulCream,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: FireTodoColors.mindfulBrown,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const FireTodoMainScreen(),
    );
  }
}
