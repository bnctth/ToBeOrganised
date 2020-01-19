import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/category_icon.dart';
import '../components/category_infos.dart';
import '../components/gradient_fab.dart';
import '../models/category.dart';
import '../models/task.dart';
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
        body: TaskList(category: category),
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

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryIcon(),
              SizedBox(
                height: 25,
              ),
              CategoryInfos(),
            ],
          ),
        ),
      ]..addAll(Provider.of<Tasks>(context)
          .currentCategory
          .tasks
          .map((t) => TaskListCard(t, () {
                Provider.of<Tasks>(context, listen: false)
                    .currentCategory
                    .readdTask();
                Scaffold.of(context)
                    .removeCurrentSnackBar(reason: SnackBarClosedReason.action);
              }))
          .toList()),
    );
  }
}

class TaskListCard extends StatelessWidget {
  final Task t;
  final Function restore;

  TaskListCard(this.t, this.restore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 35),
      child: ListTile(
        leading: Checkbox(
          value: t.checked,
          activeColor: Provider.of<Tasks>(context).currentColors[1],
          onChanged: (_) {
            t.toggle();
          },
        ),
        title: Text(
          t.name,
          style: TextStyle(
            decoration: t.checked ? TextDecoration.lineThrough : null,
            color: t.checked ? Colors.black38 : Colors.black,
          ),
        ),
        trailing: t.checked
            ? GestureDetector(
                onTap: () {
                  var toRestore = t;
                  Scaffold.of(context).removeCurrentSnackBar(
                      reason: SnackBarClosedReason.action);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Removed ${toRestore.name}'),
                        GestureDetector(
                          onTap: restore,
                          child: Text('undo'),
                        )
                      ],
                    ),
                  ));
                  Provider.of<Tasks>(context, listen: false)
                      .currentCategory
                      .deleteTask(t);
                },
                child: Icon(FontAwesomeIcons.trash),
              )
            : null,
      ),
    );
  }
}
