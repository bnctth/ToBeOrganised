import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/tasks.dart';

class AddScreen extends StatelessWidget {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.times)),
        iconTheme: IconThemeData(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'What tasks are you going to perform?',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Montserrat',
                  ),
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 30),
                  onChanged: (s) {
                    name = s;
                  },
                  onSubmitted: (a) {
                    if (name != "") {
                      Provider.of<Tasks>(context, listen: false)
                          .currentCategory
                          .createTask(name);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
          Hero(
            tag: 'add',
            child: GestureDetector(
              onTap: () {
                if (name != "") {
                  Provider.of<Tasks>(context, listen: false)
                      .currentCategory
                      .createTask(name);
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: Provider.of<Tasks>(context).currentColors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                ),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
