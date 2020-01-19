
import 'package:flutter/material.dart';

enum NewCategoryProgress { name, color, icon }

class NewCategoryP extends ChangeNotifier {
  String newCategoryName = '';
  Color newCategoryColor = Colors.teal;
  IconData newCategoryIcon = Icons.device_unknown;
  NewCategoryProgress newCategoryProgress = NewCategoryProgress.name;
  String _iconSearch='';

  void setNewCategoryName(String name) {
    newCategoryName = name;
    notifyListeners();
  }

  void setNewCategoryColor(Color color) {
    newCategoryColor = color;
    notifyListeners();
  }

  void setNewCategoryIcon(IconData icon) {
    newCategoryIcon = icon;
    notifyListeners();
  }

  void setNewCategoryProgress(NewCategoryProgress p) {
    newCategoryProgress = p;
    notifyListeners();
  }

  void resetNewCategory() {
    newCategoryProgress = NewCategoryProgress.name;
    newCategoryColor = Colors.teal;
    newCategoryIcon = Icons.device_unknown;
    newCategoryName = '';
    notifyListeners();
  }

  String get iconSearch=>_iconSearch;

  set iconSearch(String s){
    _iconSearch=s;
    notifyListeners();
  }
}