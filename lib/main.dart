import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tasks.dart';
import 'screens/add_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (_) => Tasks(),
      child: MaterialApp(
        routes: {
          '/': (context) => MainScreen(),
          '/tasks':(context)=>TasksScreen(),
          '/add':(context)=>AddScreen()
        },
        initialRoute: '/',
      ),
    );
  }
}
