import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';

import 'category_icon.dart';
import 'category_infos.dart';

enum MenuButton { name, color, delete }

class CategoryCard extends StatelessWidget {
  final double width;

//  final Category category;
  Color newColor;
  String newName = '';

  CategoryCard(
    this.width,
    /*this.category*/
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 200,
        width: width,
        margin: EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 10),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CategoryIcon(),
                  PopupMenuButton(
                    tooltip: 'Category settings',
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Change name'),
                        value: MenuButton.name,
                      ),
                      PopupMenuItem(
                        child: Text('Change color'),
                        value: MenuButton.color,
                      ),
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: MenuButton.delete,
                      ),
                    ],
                    onSelected: (mb) {
                      switch (mb) {
                        case MenuButton.name:
                          menuDialog(
                            context: context,
                            title: 'Rename',
                            body: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Enter the new name',
                              ),
                              onChanged: (s) {
                                newName = s;
                              },
                            ),
                            onSet: () {
                              Provider.of<Tasks>(context, listen: false)
                                  .renameCurrentCategory(newName);
                              Navigator.pop(context);
                            },
                          );
                          break;
                        case MenuButton.color:
                          menuDialog(
                            context: context,
                            title: 'New color',
                            body: MaterialPicker(
                              onColorChanged: (c) {
                                newColor = c;
                              },
                            ),
                            onSet: () {
                              Provider.of<Tasks>(context, listen: false)
                                  .newColorCurrentCategory(newColor);
                              Navigator.pop(context);
                            },
                          );
                          break;
                        case MenuButton.delete:
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'Are you sure you want to delete this category?'),
                                    actions: <Widget>[
                                      OutlineButton(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Provider.of<Tasks>(context)
                                                .currentColors[1],
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      RaisedButton(
                                        color: Provider.of<Tasks>(context)
                                            .currentColors[1],
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Provider.of<Tasks>(context,listen: false)
                                              .deleteCurrentCategory();
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ));
                      }
                    },
                  ),
                ],
              ),
              CategoryInfos()
            ],
          ),
        ),
      ),
    );
  }
}

void menuDialog(
    {BuildContext context, String title, Widget body, Function onSet}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: body,
            actions: <Widget>[
              OutlineButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Provider.of<Tasks>(context).currentColors[1],
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                color: Provider.of<Tasks>(context).currentColors[1],
                child: Text(
                  'Set',
                  style:
                      TextStyle(fontFamily: 'Montserrat', color: Colors.white),
                ),
                onPressed: onSet,
              )
            ],
          ));
}
