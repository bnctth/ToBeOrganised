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
  int lastDeletedI;
  Task lastDeletedT;

  Category({String name, IconData icon, Color color, Tasks sp}) {
    this.name = name;
    this.icon = icon;
    final _hslcolor = HSLColor.fromColor(color);
    colors = [
      _hslcolor.withHue((_hslcolor.hue + 30) % 360).toColor(),
      color,
      _hslcolor.withHue((_hslcolor.hue - 30) % 360).toColor()
    ];
    this.sp = sp;
  }

  Category.load(
      {String name,
      IconData icon,
      List<Color> colors,
      List<Task> tasks,
      Tasks sp}) {
    this.name = name;
    this.icon = icon;
    this.colors = colors;
    this._tasks = tasks;
    this.sp = sp;
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void createTask(String name) {
    _tasks.add(Task(name, sp));
    sp.taskCount++;
    sp.notifyListeners();
  }

  void deleteTask(Task task) {
    lastDeletedI = _tasks.indexOf(task);
    lastDeletedT = task;
    _tasks.remove(task);
    sp.taskCount--;
    sp.notifyListeners();
  }

  void readdTask() {
    _tasks.insert(lastDeletedI, lastDeletedT);
    sp.taskCount++;
    sp.notifyListeners();
  }

  double get taskPercentage {
    if (_tasks.length == 0) return 0;
    int checked = 0;
    for (int i = 0; i < _tasks.length; i++) {
      _tasks[i].checked ? checked++ : {};
    }
    return checked / _tasks.length;
  }
}
