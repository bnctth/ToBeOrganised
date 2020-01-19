import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/new_category_provider.dart';
import 'package:todo/models/storages.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        left: 120,
        right: 120,
      ),
      child: Tooltip(
        message: 'Create category',
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        child: GestureDetector(
            onTap: () {
              Provider.of<NewCategoryP>(context,listen: false).resetNewCategory();
              StringStorage.instance.newCategoryName='';
              Navigator.pushNamed(context, '/addcategory');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 10),
                    )
                  ]),
              child: Icon(Icons.add),
            )),
      ),
    );
  }
}
