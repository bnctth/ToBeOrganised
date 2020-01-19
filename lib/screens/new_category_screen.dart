import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/color_select.dart';
import 'package:todo/components/icon_select.dart';
import 'package:todo/components/name_select.dart';
import 'package:todo/models/new_category_provider.dart';

class NewCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _hslcolor =
        HSLColor.fromColor(Provider.of<NewCategoryP>(context).newCategoryColor);
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              _hslcolor.withHue((_hslcolor.hue + 30) % 360).toColor(),
              Provider.of<NewCategoryP>(context).newCategoryColor,
              _hslcolor.withHue((_hslcolor.hue - 30) % 360).toColor()
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              Provider.of<NewCategoryP>(context).newCategoryName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FontAwesomeIcons.times,
                  color: Colors.white,
                )),
            iconTheme: IconThemeData(),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ExpansionPanelList(
                  children: <ExpansionPanel>[
                    nameSelect(context),
                    colorSelect(context),
                    iconSelect(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
