import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/model/factory.dart';
import 'package:tkudatabaseproject/model/models.dart';

class ManagementPage extends StatefulWidget {
  final Type modelType;

  ManagementPage({
    this.modelType
  });

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {

  var models = [];
  Type type;

  title(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Text(text, style: TextStyle(color: colorOf[type], fontSize: 23, fontWeight: FontWeight.bold),),
    );
  }

  @override
  void initState() {
    super.initState();

  }

  init() {
    models = findAllOf[type]();
  }

  modelList() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: colorOf[type]),
      ),
      child: ListView(
        children: models.map((model) => _Row(model: model,)).toList(),
      ),
//      models
    );
  }

  @override
  Widget build(BuildContext context) {
    type = widget.modelType;

    return Scaffold(
      appBar: AppBar(
        title: Text(tableNameOf[widget.modelType]),
        backgroundColor: colorOf[widget.modelType],
      ),
      body: ListView(
        children: <Widget>[
          title('搜尋/新增'),
          _Form(modelType: widget.modelType,),
          title('搜尋結果'),
          modelList(),
          title('修改'),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final BaseModel model;

  _Row({this.model});

  List<Widget> content() {
    switch (model.runtimeType) {
      case Member:
        var member = model as Member;
        return [
          Text(member.name),
        ];
      case Product:
        return [

        ];
      case Author:
        return [];
      case Transaction:
        return [];
      case Cart:
        return [];
      case Browse:
        return [];
      case Order:
        return [];
      case Record:
        return [];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: content(),
    );
  }
}


class _Form extends StatefulWidget {
  final Type modelType;

  _Form({this.modelType});

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: colorOf[widget.modelType]),
      ),
    );
  }
}
