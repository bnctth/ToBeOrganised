import 'package:flutter/material.dart';

import 'task.dart';

class Category {
  String name;
  List<Task> tasks = [];
  Icon icon;
  List<Color> colors = [];

  Category({String name, Icon icon, Color color}) {
    this.name = name;
    this.icon = icon;
    final _hslcolor = HSLColor.fromColor(color);
    colors = [
      HSLColor.fromColor(color).withHue((_hslcolor.hue + 30) % 360).toColor(),
      color,
      HSLColor.fromColor(color).withHue((_hslcolor.hue - 30) % 360).toColor()
    ];
  }
}
