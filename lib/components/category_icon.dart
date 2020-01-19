import 'package:flutter/material.dart';
import 'package:todo/models/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;

  CategoryIcon(this.category);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${category.hashCode}/icon',
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: Icon(
            category.icon,
            color: category.colors[1],
          ),
        ),
      ),
    );
  }
}
