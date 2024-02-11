import 'package:firebase_core/firebase_core.dart';
import 'package:firetodo/providers/providers.dart';
import 'package:firetodo/screens/screens.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FireTodoApp());
}

class FireTodoApp extends StatelessWidget {
  const FireTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FireTodoListNotifier(),
      child: MaterialApp(
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
      ),
    );
  }
}
