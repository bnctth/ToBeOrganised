import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks.dart';

import 'gradient_progress_indicator.dart';

class CategoryInfos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${Provider.of<Tasks>(context).currentCategory.hashCode}/infos',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${Provider.of<Tasks>(context).currentCategory.taskCount} Tasks',
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
            Provider.of<Tasks>(context).currentCategory.name,
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
                  gradient: LinearGradient(
                      colors:
                          Provider.of<Tasks>(context).currentCategory.colors),
                  inactiveColor: Colors.grey[200],
                  value: Provider.of<Tasks>(context)
                      .currentCategory
                      .taskPercentage,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '${(Provider.of<Tasks>(context).currentCategory.taskPercentage * 100).toStringAsFixed(0)}%',
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
