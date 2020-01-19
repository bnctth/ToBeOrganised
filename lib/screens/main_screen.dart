import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/add_category_button.dart';

import '../components/background.dart';
import '../components/category_list.dart';
import '../constants.dart';
import '../models/tasks.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'ToBeOrganised',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  left: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Having a good day?\n'
                      'You have ${Provider.of<Tasks>(context).taskCount} tasks to do today.',
                      style: kWhiteText,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'TODAY: ${DateFormat('MMMM d, y').format(DateTime.now())}',
                      style: kWhiteText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Provider.of<Tasks>(context).categories.length > 0
                    ? CategoryList()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have no categories yet.\nCreate one to start!',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 25,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ),
              AddButton()
            ],
          ),
        ),
      ],
    );
  }
}
