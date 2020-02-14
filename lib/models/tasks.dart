import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/models/save_load.dart';
import 'category.dart';

class Tasks extends ChangeNotifier {
  List<Category> _categories = [];
  int _currentCategory = 0;
  int _oldCategory = 0;
  int taskCount = 0;

  static Tasks instance = Tasks._private();

  factory Tasks() => instance;

  Tasks._private();

  void loadData({int taskCount, List<Category> categories}) {
    this.taskCount = taskCount;
    _categories = categories;
  }

  UnmodifiableListView get categories => UnmodifiableListView(_categories);

  void createCategory(String name, Color color, IconData icon) async {
    Category c = Category(name: name, color: color, icon: icon, sp: this);
    _categories.add(c);
    notifyListeners();
  }

  List<Color> get currentColors => _categories[_currentCategory].colors;

  List<Color> get oldColors => _categories[_oldCategory].colors;

  Category get currentCategory => _categories[_currentCategory];

  void setCurrentCategory(bool isBigger) {
    _oldCategory = _currentCategory;
    isBigger ? _currentCategory++ : _currentCategory--;
    notifyListeners();
  }

  void renameCurrentCategory(String s) {
    _categories[_currentCategory].name = s;
    notifyListeners();
  }

  void newColorCurrentCategory(Color c) {
    final _hslcolor = HSLColor.fromColor(c);
    _categories[_currentCategory].colors = [
      _hslcolor.withHue((_hslcolor.hue + 30) % 360).toColor(),
      c,
      _hslcolor.withHue((_hslcolor.hue - 30) % 360).toColor()
    ];
    notifyListeners();
  }

  void newIconCurrentCategory(String s) {
    _categories[_currentCategory].name = s;
    notifyListeners();
  }

  void deleteCurrentCategory() {
    _categories.removeAt(_currentCategory);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    SaveLoad.instance.save();
  }
}
