import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/model/factory.dart';
import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/repository/common_dao.dart';
import 'package:tkudatabaseproject/tool/common_method.dart';

List<TextEditingController> controllers = [];

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

  clearTableButton() {
    return FlatButton(
      onPressed: () {
        CommonDAO.clearTable(tableNameOf[type]);
      },
      child: Text('清空資料表',),
    );
  }

  @override
  void initState() {
    super.initState();
    type = widget.modelType;

    init();
  }

  init() async {
    models = await findAllOf[type]();
    setState(() { });
  }

  modelGrid() {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Container(
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
        ),
      ],
    );
  }

  onInsert() async {
    switch (type) {
      case Member:
        var parameters = controllers.map((ctrl) => ctrl.text).toList();
        var member = Member.fromList(parameters);
        int id = await insertOf[type](member);
        member.memberId = id;
        models.add(member);
        break;
      case Product:
        break;
      case Author:
        break;
      case Transaction:
        break;
      case Cart:
        break;
      case Browse:
        break;
      case Order:
        break;
      case Record:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tableNameOf[widget.modelType]),
        backgroundColor: colorOf[widget.modelType],
      ),
      body: ListView(
        children: <Widget>[
          title('搜尋/新增'),
          _Form(
            modelType: widget.modelType,
            onInsert: onInsert,
          ),
          title('搜尋結果'),
          modelGrid(),
//          title('修改'),
          title('其他操作'),
          clearTableButton(),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final BaseModel model;

  _Row({
    this.model,
  });

  List<Widget> content() {
    switch (model.runtimeType) {
      case Member:
        var member = model as Member;
        return [
          Text(member.idNumber.toString()),
          Text(member.name.toString()),
          Text(member.birthday.toString()),
          Text(member.phone.toString()),
          Text(member.address.toString()),
          Text(member.email.toString()),
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
  final Function onInsert;
  final Function onSearch;

  _Form({
    this.modelType,
    this.onInsert,
    this.onSearch,
  });

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  Type modelType;

  List<String> columnNames;

  Widget input(String columnName, int index) {
    return Row(
      children: <Widget>[
        Expanded(flex: 3,child: Text(columnName)),
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: controllers[index],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    controllers = [];
    modelType = widget.modelType;

    columnNames = insertFormColumnNamesOf[modelType];
    for (var i = 0; i < columnNames.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 4, left: 20, bottom: 0, right: 20),
          decoration: BoxDecoration(
            border: Border.all(color: colorOf[modelType]),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10, right: 20),
            children: mapIndexed(
              insertFormColumnNamesOf[modelType],
              (index, name) {
                return input(name, index);
              }).toList(),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 4, right: 20, left: 20, top: 0),
          color: colorOf[modelType],
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              FlatButton(
                onPressed: widget.onInsert,
                child: Text('新增', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        )
      ],
    );
  }
}
