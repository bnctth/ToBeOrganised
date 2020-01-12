import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final double width;

  CategoryCard(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: width,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
