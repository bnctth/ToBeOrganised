import 'dart:collection';

import 'package:flutter/material.dart';
import 'category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tasks extends ChangeNotifier {
  List<Category> _categories = [
    Category(
      name: 'Home',
      color: Colors.green,
      icon: Icon(FontAwesomeIcons.home),
    ),
    Category(
      name: 'Home',
      color: Colors.red,
      icon: Icon(FontAwesomeIcons.home),
    ),
    Category(
      name: 'Home',
      color: Colors.cyan,
      icon: Icon(FontAwesomeIcons.home),
    ),
  ];
  int _currentCategory = 0;
  int _oldCategory=0;

  Tasks();

  UnmodifiableListView get categories => UnmodifiableListView(_categories);

  void createCategory(String name, Color color, Icon icon) {
    _categories.add(Category(name: name, color: color, icon: icon));
    notifyListeners();
  }

  List<Color> get currentColors => _categories[_currentCategory].colors;

  List<Color> get oldColors => _categories[_oldCategory].colors;


  void setCurrentCategory(bool isBigger) {
//    _oldCategory=_currentCategory+0;
    isBigger ? _currentCategory++ : _currentCategory--;
    notifyListeners();
  }
}
