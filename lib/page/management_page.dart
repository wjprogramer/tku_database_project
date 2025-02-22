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
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: colorOf[type]),
          ),
          child: ListView(
            children: [
              Container(
                color: colorOf[type],
                child: _TableHeader(type: type,)
              ),
              ...models.map((model) => _TableRow(model: model,)).toList()
            ],
          ),
//      models
        ),
      ],
    );
  }

  onInsert() async {
    var parameters = controllers.map((ctrl) => ctrl.text).toList();

    switch (type) {
      case Member:
        var member = Member.fromList(parameters);
        int id = await insertOf[type](member);
        member.memberId = id;
        models.add(member);
        setState(() { });
        break;
      case Product:
        var product = Product.fromList(parameters);
        int id = await insertOf[type](product);
        product.productNumber = id.toString();
        models.add(product);
        setState(() { });
        break;
      case Author:
        var author = Author.fromList(parameters);
        int id = await insertOf[type](author);
        models.add(author);
        setState(() { });
        break;
      case Transaction:
        var transaction = Transaction.fromList(parameters);
        int id = await insertOf[type](transaction);
        transaction.transNumber = id.toString();
        models.add(transaction);
        setState(() { });
        break;
      case Cart:
        var cart = Cart.fromList(parameters);
        int id = await insertOf[type](cart);
        models.add(cart);
        setState(() { });
        break;
      case Browse:
        var browse = Browse.fromList(parameters);
        int id = await insertOf[type](browse);
        models.add(browse);
        setState(() { });
        break;
      case Order:
        var order = Order.fromList(parameters);
        int id = await insertOf[type](order);
        models.add(order);
        setState(() { });
        break;
      case Record:
        var record = Record.fromList(parameters);
        int id = await insertOf[type](record);
        models.add(record);
        setState(() { });
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
          title('表格內容'),
          modelGrid(),
//          title('修改'),
          title('其他操作'),
          clearTableButton(),
        ],
      ),
    );
  }
}

class _TableHeader<T> extends StatelessWidget {
  final Type type;

  _TableHeader({this.type});

  Widget header(String headerName, {bool isLast = false}) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                      color: isLast ? colorOf[type] : Colors.white,
                    )
                )
            ),
            child: Text(headerName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        )
    );
  }

  List<Widget> headers() {
    switch (type) {
      case Member:
        return [
          header('memberId'),
          header('name'),
          header('birthday', isLast: true),
        ];
      case Product:
        return [
          header('productNumber'),
          header('productName'),
          header('unitPrice'),
          header('category'),
        ];
      case Author:
        return [
          header('productNumber'),
          header('name'),
        ];
      case Transaction:
        return [
          header('transNumber'),
          header('transMember'),
          header('transTime'),
        ];
      case Cart:
        return [
          header('memberId'),
          header('cartTime'),
          header('transNumber'),
        ];
      case Browse:
        return [
          header('memberId'),
          header('browseTime'),
          header('productNumber'),
        ];
      case Order:
        return [
          header('memberId'),
          header('cartTime'),
          header('productNumber'),
          header('amount'),
        ];
      case Record:
        return [
          header('transNumber'),
          header('productNumber'),
          header('amount'),
          header('salePrice'),
        ];
      default:
        return [
          header('memberId'),
          header('name'),
          header('birthday'),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: headers(),
    );
  }
}


class _TableRow extends StatelessWidget {
  final BaseModel model;

  _TableRow({
    this.model,
  });

  List<Widget> content() {
    switch (model.runtimeType) {
      case Member:
        var member = model as Member;
        return [
          Expanded(
            child: Text(member.memberId.toString())
          ),
          Expanded(
            child: Text(member.name.toString()),
          ),
          Expanded(
            child: Text(member.birthday.toString()),
          ),
        ];
      case Product:
        var product = model as Product;
        return [
          Expanded(
              child: Text(product.productNumber.toString())
          ),
          Expanded(
            child: Text(product.productName.toString()),
          ),
          Expanded(
            child: Text(product.unitPrice.toString()),
          ),
          Expanded(
            child: Text(product.category.toString()),
          ),
        ];
      case Author:
        var author = model as Author;
        return [
          Expanded(
              child: Text(author.productNumber.toString())
          ),
          Expanded(
            child: Text(author.name.toString()),
          ),
        ];
      case Transaction:
        var transaction = model as Transaction;
        return [
          Expanded(
              child: Text(transaction.transNumber.toString())
          ),
          Expanded(
            child: Text(transaction.transMember.toString()),
          ),
          Expanded(
            child: Text(transaction.transTime.toString()),
          ),
        ];
      case Cart:
        var cart = model as Cart;
        return [
          Expanded(
              child: Text(cart.memberId.toString())
          ),
          Expanded(
            child: Text(cart.cartTime.toString()),
          ),
          Expanded(
            child: Text(cart.transNumber.toString()),
          ),
        ];
      case Browse:
        var browse = model as Browse;
        return [
          Expanded(
              child: Text(browse.memberId.toString())
          ),
          Expanded(
            child: Text(browse.browseTime.toString()),
          ),
          Expanded(
            child: Text(browse.productNumber.toString()),
          ),
        ];
      case Order:
        var order = model as Order;
        return [
          Expanded(
              child: Text(order.memberId.toString())
          ),
          Expanded(
            child: Text(order.cartTime.toString()),
          ),
          Expanded(
            child: Text(order.productNumber.toString()),
          ),
          Expanded(
            child: Text(order.amount.toString()),
          ),
        ];
      case Record:
        var record = model as Record;
        return [
          Expanded(
              child: Text(record.transNumber.toString())
          ),
          Expanded(
            child: Text(record.productNumber.toString()),
          ),
          Expanded(
            child: Text(record.amount.toString()),
          ),
          Expanded(
            child: Text(record.salePrice.toString()),
          ),
        ];
      default:
        var member = model as Member;
        return [
          Expanded(
              child: Text(member.memberId.toString())
          ),
          Expanded(
            child: Text(member.name.toString()),
          ),
          Expanded(
            child: Text(member.birthday.toString()),
          ),
        ];
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
