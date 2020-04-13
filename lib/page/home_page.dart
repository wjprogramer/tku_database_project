import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/repository/database_creator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> initDatabase() async {
    await MyDatabase().initDatabase();
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首頁'),),
      body: FutureBuilder(
        future: initDatabase(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Center(child: Text('初始化完成'));
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Text('初始化資料庫'),
              ],
            ),
          );
        }
      ),
    );
  }
}
