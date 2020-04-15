import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/page/background_page.dart';
import 'package:tkudatabaseproject/page/login_page.dart';
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

  Widget button(String text, Widget page) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page
        ));
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首頁'),),
      body: FutureBuilder(
        future: initDatabase(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView(
              children: <Widget>[
                button('後台管理頁面', BackgroundPage()),
                button('商店登入頁面', LoginPage()),
              ],
            );
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
