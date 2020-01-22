import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/category.dart';
import 'package:todo/models/tasks.dart';

const categoryTable = 'category';
const categoryName = 'name';
const categoryColor = 'color';
const categoryICP = 'iconCodePoint';
const categoryIFF = 'iconFontFamily';
const categoryIMTD = 'iconMTD';

const taskTable = 'task';
const taskName = 'name';
const taskIsChecked = 'isChecked';
const taskCategoryID = 'categoryID';

class DBManager {
  Database _db;
  Tasks tasks;
  bool loaded = false;

  DBManager._privateConstructor() {
    tasks = Tasks();
  }

  Future<void> openDB() async {
    if (_db == null) {
      _db = await openDatabase('tbo.db', version: 1, onCreate: (db, v) async {
        await db.execute('''
          CREATE TABLE $categoryTable(
            id INTEGER PRIMARY KEY,
            $categoryName VARCHAR NOT NULL,
            $categoryColor INT NOT NULL,
            $categoryICP INT NOT NULL,
            $categoryIFF VARCHAR NOT NULL,
            $categoryIMTD INT NOT NULL
          );
          ''');
        await db.execute('''
        CREATE TABLE $taskTable(
          id INTEGER PRIMARY KEY,
          $taskName VARCHAR NOT NULL,
          $taskIsChecked INT NOT NULL,
          $taskCategoryID INT,
          FOREIGN KEY($taskCategoryID) REFERENCES $categoryTable(id) ON UPDATE CASCADE ON DELETE CASCADE
        );
        ''');
      }, onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      });
//      await _db.insert(taskTable,
//          {taskName: 'buy paper', taskIsChecked: 0, taskCategoryID: 61});
//      await _db.insert(taskTable,
//          {taskName: 'buy pen', taskIsChecked: 0, taskCategoryID: 61});
//      await _db.insert(taskTable,
//          {taskName: 'buy banana', taskIsChecked: 0, taskCategoryID: 57});
//      await _db.insert(taskTable,
//          {taskName: 'buy pc', taskIsChecked: 0, taskCategoryID: 57});
    }
  }

  Future<void> load() async {
    if (loaded) return;
    loaded = true;
    await openDB();
    List<Map<String, dynamic>> categories =
        await _db.query(categoryTable, groupBy: categoryName, orderBy: 'id');
    print(categories);
    for (final c in categories) {
      tasks.createCategory(
        c[categoryName],
        Color(c[categoryColor]),
        IconData(c[categoryICP],
            fontFamily: c[categoryIFF],
            matchTextDirection: c[categoryIMTD] == 1),
      );
    }
    List<Map<String, dynamic>> loadedTasks =
        await _db.query(taskTable, groupBy: categoryName, orderBy: 'id');
    print(loadedTasks);
  }

  Future<int> createCategory(Category c) async {
    return _db.insert(categoryTable, {
      categoryName: c.name,
      categoryColor: c.colors[1].value,
      categoryICP: c.icon.codePoint,
      categoryIFF: c.icon.fontFamily,
      categoryIMTD: c.icon.matchTextDirection ? 1 : 0,
    });
  }

  factory DBManager() => instance;
  static final instance = DBManager._privateConstructor();
}
