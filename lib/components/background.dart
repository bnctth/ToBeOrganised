import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

import '../models/tasks.dart';

class GradientBackground extends StatefulWidget {
  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  List<Color> oldColors;
  List<Color> currentColors;
  MultiTrackTween tween;

  @override
  void initState() {
    super.initState();
    oldColors = Provider
        .of<Tasks>(context, listen: false)
        .oldColors;
    currentColors = Provider
        .of<Tasks>(context, listen: false)
        .currentColors;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Tasks>(context, listen: false).addListener(() {
      print('most');
      setState(() {
        oldColors = Provider
            .of<Tasks>(context, listen: false)
            .oldColors;
        currentColors =
            Provider
                .of<Tasks>(context, listen: false)
                .currentColors;
        print(oldColors);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Animation(tween: MultiTrackTween([
      Track("color1").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[0], end: currentColors[0])),
      Track("color2").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[1], end: currentColors[1])),
      Track("color3").add(Duration(milliseconds: 500),
          ColorTween(begin: oldColors[2], end: currentColors[2]))
    ]));
  }
}

class Animation extends StatelessWidget {
  const Animation({
    Key key,
    @required this.tween,
  }) : super(key: key);

  final MultiTrackTween tween;

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      tween: tween,
      duration: tween.duration,
      playback: Playback.PLAY_FORWARD,
      builder: (context, animation) {
        return Container(
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
        );
      },
    );
  }
}
