import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';


class CategoryIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${Provider.of<Tasks>(context).currentCategory.hashCode}/icon',
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: Icon(
            Provider.of<Tasks>(context).currentCategory.icon,
            color: Provider.of<Tasks>(context).currentCategory.colors[1],
          ),
        ),
      ),
    );
  }

}
