import 'dart:collection';

import 'package:flutter/material.dart';
import 'category.dart';

class Tasks extends ChangeNotifier {
  List<Category> _categories = [];
  int _currentCategory = 0;
  int _oldCategory = 0;

  Tasks() {
    _categories = [];
  }

  UnmodifiableListView get categories => UnmodifiableListView(_categories);

  void createCategory(String name, Color color, IconData icon) {
    _categories.insert(
        _currentCategory == 0 ? _currentCategory : _currentCategory + 1,
        Category(name: name, color: color, icon: icon, sp: this));
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

  void deleteCurrentCategory(){
    _categories.removeAt(_currentCategory);
    notifyListeners();
  }
}
