import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/category_icon.dart';
import '../components/category_infos.dart';
import '../components/gradient_fab.dart';
import '../models/category.dart';
import '../models/tasks.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Category category = Provider.of<Tasks>(context).currentCategory;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Provider.of<Tasks>(context).currentColors[0]),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 50),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CategoryIcon(category),
                  SizedBox(
                    height: 25,
                  ),
                  CategoryInfos(category),
                ],
              ),
            ]..addAll(Provider.of<Tasks>(context)
                .currentCategory
                .tasks
                .map((t) => ListTile(
                      leading: Checkbox(
                        value: t.checked,
                        onChanged: (_) {
                          t.toggle();
                        },
                      ),
                      title: Text(
                        t.name,
                        style: TextStyle(
                          decoration:
                              t.checked ? TextDecoration.lineThrough : null,
                          color: t.checked ? Colors.black38 : Colors.black,
                        ),
                      ),
                      trailing: t.checked
                          ? GestureDetector(
                              onTap: () {
                                Provider.of<Tasks>(context, listen: false)
                                    .currentCategory
                                    .deleteTask(t);
                              },
                              child: Icon(FontAwesomeIcons.trash),
                            )
                          : null,
                    ))
                .toList()),
          ),
        ),
        floatingActionButton: Hero(
          tag: 'add',
          child: GradientFloatingActionButton(
            colors: category.colors,
            icon: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ));
  }
}
