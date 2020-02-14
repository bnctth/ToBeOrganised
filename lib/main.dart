import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/new_category_provider.dart';
import 'package:todo/screens/loading_screen.dart';
import 'package:todo/screens/new_category_screen.dart';

import 'models/tasks.dart';
import 'screens/add_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Tasks(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewCategoryP(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/load':(context)=>LoadingScreen(),
          '/': (context) => MainScreen(),
          '/tasks': (context) => TasksScreen(),
          '/add': (context) => AddScreen(),
          '/addcategory': (context) => NewCategory(),
          '/load': (context) => LoadingScreen(),
        },
        initialRoute: '/load',
      ),
    );
  }
}
