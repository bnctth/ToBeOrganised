import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<Tasks>(context).categories.length > 0
        ? AnimatedGradientBackground()
        : Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.teal, Colors.lightGreenAccent],
              ),
            ),
          );
  }
}

class AnimatedGradientBackground extends StatefulWidget {
  @override
  _AnimatedGradientBackgroundState createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation color1;
  Animation color2;
  Animation color3;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller.addListener(() {
      setState(() {});
    });
    setAnimation();
    super.initState();
  }

  void setAnimation() {
    setState(() {
      color1 = ColorTween(
              begin: Provider.of<Tasks>(context, listen: false).oldColors[0],
              end: Provider.of<Tasks>(context, listen: false).currentColors[0])
          .animate(_controller);
      color2 = ColorTween(
              begin: Provider.of<Tasks>(context, listen: false).oldColors[1],
              end: Provider.of<Tasks>(context, listen: false).currentColors[1])
          .animate(_controller);
      color3 = ColorTween(
              begin: Provider.of<Tasks>(context, listen: false).oldColors[2],
              end: Provider.of<Tasks>(context, listen: false).currentColors[2])
          .animate(_controller);
      _controller.forward(from: 0.0);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<Tasks>(context).addListener(() {
      setAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [color1.value, color2.value, color3.value],
        ),
      ),
    );
  }
}
