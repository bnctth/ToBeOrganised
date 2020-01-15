import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/category.dart';
import 'gradient_progress_indicator.dart';

class CategoryCard extends StatelessWidget {
  final double width;
  final Category category;

  CategoryCard(this.width, this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: width,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  elevation: 5,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '9 Tasks',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  category.name,
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GradientProgressIndicator(
                        gradient: LinearGradient(colors: category.colors),
                        inactiveColor: Colors.grey[200],
                        value: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        '50%',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
