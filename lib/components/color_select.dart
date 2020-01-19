import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/new_category_provider.dart';



class ColorSelect extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialPicker(
          pickerColor: Colors.teal,
          onColorChanged: (c) {
            Provider.of<NewCategoryP>(context, listen: false).setNewCategoryColor(c);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlineButton(
              child: Text('Previous',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Provider.of<NewCategoryP>(context).newCategoryColor,
                  )),
              color: Provider.of<NewCategoryP>(context).newCategoryColor,
              onPressed: () {
                FocusScope.of(context).unfocus();
                Provider.of<NewCategoryP>(context, listen: false)
                    .setNewCategoryProgress(NewCategoryProgress.name);
              },
            ),
            RaisedButton(
              child: Text('Next',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  )),
              color: Provider.of<NewCategoryP>(context).newCategoryColor,
              onPressed: () {
                Provider.of<NewCategoryP>(context, listen: false)
                    .setNewCategoryProgress(NewCategoryProgress.icon);
              },
            )
          ],
        )
      ],
    );
  }
}