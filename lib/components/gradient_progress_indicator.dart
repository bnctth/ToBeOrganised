import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks.dart';

class GradientProgressIndicator extends StatefulWidget {
  final Color inactiveColor;
  final Gradient gradient;

  GradientProgressIndicator({this.inactiveColor, this.gradient});

  @override
  _GradientProgressIndicatorState createState() =>
      _GradientProgressIndicatorState();
}

class _GradientProgressIndicatorState extends State<GradientProgressIndicator>
    with SingleTickerProviderStateMixin {
  double oldValue = 0;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween(
            begin: oldValue,
            end: Provider.of<Tasks>(context, listen: false)
                .currentCategory
                .taskPercentage)
        .animate(controller);
    oldValue = Provider.of<Tasks>(context, listen: false)
        .currentCategory
        .taskPercentage;
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    Provider.of<Tasks>(context,listen:false).addListener(() {
      animation = Tween(
              begin: oldValue,
              end: Provider.of<Tasks>(context, listen: false)
                  .currentCategory
                  .taskPercentage)
          .animate(controller);
      oldValue = Provider.of<Tasks>(context, listen: false)
          .currentCategory
          .taskPercentage;
      controller.forward();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: widget.inactiveColor,
      ),
      height: 3,
      width: double.infinity,
      child: FractionallySizedBox(
        widthFactor: animation.value,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            gradient: widget.gradient,
          ),
        ),
      ),
    );
  }
}
