import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: Provider.of<Tasks>(context).categories.length > 0
              ? Provider.of<Tasks>(context).currentColors
              : [Colors.teal, Colors.lightGreenAccent],
        ),
      ),
    );
  }
}
