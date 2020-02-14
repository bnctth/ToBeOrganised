import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:todo/models/category.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/tasks.dart';

const kFileName = 'todos.json';

class SaveLoad {
  String path;

  static final SaveLoad instance = SaveLoad._private();

  SaveLoad._private();

  factory SaveLoad() => instance;

  Future<void> load() async {
    File file = File(path ?? await _getPath());
    if (!await file.exists()) return;
    Map<String, dynamic> data = jsonDecode(file.readAsStringSync());
    print(data);
    List<Category> cs = [];
    for (Map<String, dynamic> c in data['categories']) {
      List<Color> colors = [];
      for (int co in c['colors']) {
        colors.add(Color(co));
      }

      List<Task> tasks = [];
      for (Map<String, dynamic> t in c['tasks']) {
        tasks.add(Task(t['name'], Tasks.instance, checked: t['checked']));
      }

      cs.add(Category.load(
        name: c['name'],
        sp: Tasks.instance,
        icon: IconData(
          c['icon']['codePoint'],
          fontFamily: c['icon']['fontFamily'],
          matchTextDirection: c['icon']['matchTextDirection'],
        ),
        colors: colors,
        tasks: tasks,
      ));
    }
    Tasks.instance.loadData(taskCount: data['taskCount'], categories: cs);
  }

  Future<String> _getPath() async {
    path = "${(await getApplicationDocumentsDirectory()).path}/$kFileName";
    return path;
  }

  Future<void> save() async {
    Tasks tasks = Tasks.instance;
    Map<String, dynamic> data = {
      'taskCount': tasks.taskCount,
      'categories': tasks.categories
          .map((c) => {
                'name': c.name,
                'icon': {
                  'codePoint': c.icon.codePoint,
                  'fontFamily': c.icon.fontFamily,
                  'matchTextDirection': c.icon.matchTextDirection,
                },
                'colors': c.colors.map((col) => col.value).toList(),
                'tasks': c.tasks
                    .map((t) => {
                          'name': t.name,
                          'checked': t.checked,
                        })
                    .toList(),
              })
          .toList(),
    };
    File(path ?? await _getPath()).writeAsStringSync(jsonEncode(data));
  }
}
