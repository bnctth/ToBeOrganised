import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  left: 50,
                  right: 50,
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
                      'You have 3 tasks to do today.',
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
                child: CategoryList(),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ],
    );
  }
}
