import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tkudatabaseproject/repository/table_creator.dart';

class MyDatabase {
  static Database db;

  static const DB_NAME = 'OnlineShop';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath(DB_NAME);
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await MemberTableCreator.createTodoTable(db);
    await ProductTableCreator.createTodoTable(db);
    await AuthorTableCreator.createTodoTable(db);
    await TransactionTableCreator.createTodoTable(db);
    await CartTableCreator.createTodoTable(db);
    await BrowseTableCreator.createTodoTable(db);
    await OrderTableCreator.createTodoTable(db);
    await RecordTableCreator.createTodoTable(db);
  }
}


