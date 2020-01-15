import 'package:flutter/material.dart';

class GradientFloatingActionButton extends StatelessWidget {
  List<Color> colors;
  IconData icon;
  Function onPressed;

  GradientFloatingActionButton({this.colors, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
