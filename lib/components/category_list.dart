import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

import 'category_card.dart';

class CategoryList extends StatelessWidget {
  final _controller = ScrollController();
  double scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SwipeDetector(
      onSwipeLeft: () {
        scrollOffset += width - 70;
        scrollOffset = scrollOffset.clamp(0.0, (3 - 1) * (width - 70));
        _controller.animateTo(scrollOffset,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
      },
      onSwipeRight: () {
        scrollOffset -= width - 70;
        scrollOffset = scrollOffset.clamp(0.0, (3 - 1) * (width - 70));
        _controller.animateTo(scrollOffset,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOutExpo);
      },
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: <Widget>[
          SizedBox(
            width: 50,
          ),
          CategoryCard(width - 100),
          CategoryCard(width - 100),
          CategoryCard(width - 100),
          SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }
}

