import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/icons.dart';
import 'package:todo/models/new_category_provider.dart';
import 'package:todo/models/tasks.dart';

class IconSelect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Provider.of<NewCategoryP>(context).newCategoryColor),
              ),
              hintText: 'Search...',
            ),
            onChanged: (s) {
              Provider.of<NewCategoryP>(context, listen: false).iconSearch = s;
            },
          ),
        ),
        SearchResults(Provider.of<NewCategoryP>(context).iconSearch),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlineButton(
              child: Text('Previous',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Provider.of<NewCategoryP>(context).newCategoryColor,
                  )),
              color: Provider.of<NewCategoryP>(context).newCategoryColor,
              onPressed: () {
                FocusScope.of(context).unfocus();
                Provider.of<NewCategoryP>(context, listen: false)
                    .setNewCategoryProgress(NewCategoryProgress.color);
              },
            ),
            RaisedButton(
              child: Text('Finish',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  )),
              color: Provider.of<NewCategoryP>(context).newCategoryColor,
              onPressed: () {
                Provider.of<Tasks>(context, listen: false).createCategory(
                  Provider.of<NewCategoryP>(context, listen: false)
                      .newCategoryName,
                  Provider.of<NewCategoryP>(context, listen: false)
                      .newCategoryColor,
                  Provider.of<NewCategoryP>(context, listen: false)
                      .newCategoryIcon,
                );
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}

class SearchResults extends StatelessWidget {
  final String keyword;

  SearchResults(this.keyword);

  @override
  Widget build(BuildContext context) {
    final foundIcons = _search(keyword);
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: foundIcons.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            Provider.of<NewCategoryP>(context, listen: false)
                .setNewCategoryIcon(foundIcons.values.toList()[i]);
          },
          child: Container(
            color: Provider.of<NewCategoryP>(context).newCategoryIcon ==
                    foundIcons.values.toList()[i]
                ? Colors.grey[200]
                : Colors.white,
            child: Icon(
              foundIcons.values.toList()[i],
              size: 70,
              color: Provider.of<NewCategoryP>(context).newCategoryColor,
            ),
          ),
        ),
      ),
    );
  }

  Map<String, IconData> _search(String searchValue) {
    Map<String, IconData> searchResult = new Map<String, IconData>();

    icons.forEach((String key, IconData val) {
      if (key.toLowerCase().contains(searchValue.toLowerCase())) {
        searchResult.putIfAbsent(key, () => val);
      }
    });

    return searchResult;
  }
}
