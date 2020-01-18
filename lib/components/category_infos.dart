import 'package:flutter/material.dart';

import '../models/category.dart';
import 'gradient_progress_indicator.dart';

class CategoryInfos extends StatelessWidget {
  final Category category;

  CategoryInfos(this.category);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${category.hashCode}/infos',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${category.taskCount} Tasks',
            style: Theme.of(context).textTheme.title.copyWith(
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
            style: Theme.of(context).textTheme.title.copyWith(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                ),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '${(category.taskPercentage * 100).toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
