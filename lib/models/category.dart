import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';
import 'tasks.dart';

class Category {
  String name;
  List<Task> _tasks = [];
  IconData icon;
  List<Color> colors = [];
  Tasks sp;

  Category({String name, IconData icon, Color color, Tasks sp}) {
    this.name = name;
    this.icon = icon;
    final _hslcolor = HSLColor.fromColor(color);
    colors = [
      HSLColor.fromColor(color).withHue((_hslcolor.hue + 30) % 360).toColor(),
      color,
      HSLColor.fromColor(color).withHue((_hslcolor.hue - 30) % 360).toColor()
    ];
    this.sp = sp;
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void createTask(String name) {
    _tasks.add(Task(name, sp));
    sp.notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    sp.notifyListeners();
  }
}
