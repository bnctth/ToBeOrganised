import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/category.dart';
import 'category_icon.dart';
import 'category_infos.dart';

class CategoryCard extends StatelessWidget {
  final double width;
  final Category category;

  CategoryCard(this.width, this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:20.0),
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
                  CategoryIcon(category),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.ellipsisV),
                    onPressed: () {
//                    TODO category settings
                    },
                    color: Colors.grey,
                    iconSize: 20,
                  )
                ],
              ),
              CategoryInfos(category)
            ],
          ),
        ),
      ),
    );
  }
}
