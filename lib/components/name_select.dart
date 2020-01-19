import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/new_category_provider.dart';
import 'package:todo/models/storages.dart';

StringStorage instance = StringStorage.instance;



class NameSelect extends StatelessWidget {
  const NameSelect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(children: <Widget>[
        Text(
          'How do you want to call it?',
          style: TextStyle(
            fontFamily: 'Monstserrat',
            fontSize: 20,
            color: Colors.black38,
          ),
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.black38,
              ),
            ),
          ),
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 30),
          onChanged: (s) {
            instance.newCategoryName = s;
            Provider.of<NewCategoryP>(context, listen: false)
                .setNewCategoryName(s);
          },
          onSubmitted: (a) {
            if (instance.newCategoryName == '' ||
                instance.newCategoryName.split(' ').join('') == '') return;
            Provider.of<NewCategoryP>(context, listen: false)
                .setNewCategoryProgress(NewCategoryProgress.color);
          },
        ),
        RaisedButton(
          child: Text('Next',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              )),
          color: Provider.of<NewCategoryP>(context).newCategoryColor,
          onPressed: () {
            if (instance.newCategoryName == '' ||
                instance.newCategoryName.split(' ').join('') == '') return;
            FocusScope.of(context).unfocus();
            Provider.of<NewCategoryP>(context, listen: false)
                .setNewCategoryProgress(NewCategoryProgress.color);
          },
        )
      ]),
    );
  }
}
