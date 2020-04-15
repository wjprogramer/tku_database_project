import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/model/factory.dart';
import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/page/management_page.dart';
import 'package:tkudatabaseproject/widgets/list_item.dart';

class BackgroundPage extends StatefulWidget {
  @override
  _BackgroundPageState createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {

  Widget _item(Type type) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManagementPage(
          modelType: type,
        )));
      },
      child: Container(
        height: 100,
        color: colorOf[type],
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: Center(child: Icon(iconOf[type], size: 40, color: Colors.white,))
            ),
            Text(tableNameOf[type], style: TextStyle(color: Colors.white, fontSize: 40),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('後台管理頁面'),),
      body: ListView(
        children: allModelTypes.map((type) => _item(type)).toList(),
      ),
    );
  }
}
