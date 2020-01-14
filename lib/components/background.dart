import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class GradientBackground extends StatelessWidget {
  final List<Color> oldColors;
  final List<Color> currentColors;

  GradientBackground(this.oldColors, this.currentColors);

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("color1").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[0], end: currentColors[0])),
      Track("color2").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[1], end: currentColors[1])),
      Track("color3").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[2], end: currentColors[2]))
    ]);

    return ControlledAnimation(
      tween: tween,
      duration: tween.duration,
      playback: Playback.PLAY_FORWARD,
      builder: (context, animation) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                animation['color1'],
                animation['color2'],
                animation['color3']
              ]),
        ),
      ),
    );
  }
}
