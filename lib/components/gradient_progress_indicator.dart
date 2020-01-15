import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;
  final Color inactiveColor;
  final Gradient gradient;

  GradientProgressIndicator({this.value, this.inactiveColor, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: inactiveColor,
      ),
      height: 3,
      width: double.infinity,
      child: FractionallySizedBox(
        widthFactor: value,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            gradient: gradient,
          ),
        ),
      ),
    );
  }
}
