import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final double width;
  final bool add;

  CategoryCard(this.width, {this.add = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: width,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(),
    );
  }

}
