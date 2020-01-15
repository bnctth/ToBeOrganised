import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

import '../models/double_storage.dart';
import '../models/tasks.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  final _controller = ScrollController();
  var storage = DoubleStorage.instance;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SwipeDetector(
      onSwipeLeft: () {
        if (storage.a !=
            (Provider.of<Tasks>(context, listen: false).categories.length - 1) *
                (width - 70)) {
          Provider.of<Tasks>(context, listen: false).setCurrentCategory(true);
        }
        storage.a += width - 70;
        storage.a = storage.a.clamp(
            0.0,
            (Provider.of<Tasks>(context, listen: false).categories.length - 1) *
                (width - 70));

        _controller.animateTo(storage.a,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
      },
      onSwipeRight: () {
        if (storage.a != 0) {
          Provider.of<Tasks>(context, listen: false).setCurrentCategory(false);
        }
        storage.a -= width - 70;
        storage.a = storage.a.clamp(
            0.0,
            (Provider.of<Tasks>(context, listen: false).categories.length - 1) *
                (width - 70));

        _controller.animateTo(storage.a,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
      },
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: [
          SizedBox(
            width: 50,
          )
        ]
          ..addAll(Provider.of<Tasks>(context)
              .categories
              .map((t) => CategoryCard(width - 100, t))
              .toList())
          ..addAll([
            SizedBox(
              width: 50,
            )
          ]),
      ),
    );
  }
}
