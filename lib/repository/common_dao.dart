import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/repository/database_creator.dart';
import 'package:tkudatabaseproject/repository/table_creator.dart';

class CommonDAO {
  final factories = <Type, Function>{
    Member: (json) => Member.fromJson(json),
    Product: (json) => Product.fromJson(json),
    Author: (json) => Author.fromJson(json),
    Transaction: (json) => Transaction.fromJson(json),
    Cart: (json) => Cart.fromJson(json),
    Browse: (json) => Browse.fromJson(json),
    Order: (json) => Order.fromJson(json),
    Record: (json) => Record.fromJson(json),
  };

  final tableNameOf = <Type, String>{
    Member: MemberTableCreator.tableName,
    Product: ProductTableCreator.tableName,
    Author: AuthorTableCreator.tableName,
    Transaction: TransactionTableCreator.tableName,
    Cart: CartTableCreator.tableName,
    Browse: BrowseTableCreator.tableName,
    Order: OrderTableCreator.tableName,
    Record: RecordTableCreator.tableName,
  };

  Future<void> dropTable(String tableName) async {
    print('DROP TABLE');
    final sql = '''DROP TABLE $tableName''';
    await MyDatabase.db.execute(sql);
  }

  Future<List<T>> findAll<T extends BaseModel>(String tableName) async {
    final sql = '''SELECT * FROM ${tableNameOf[T]}''';

    final data = await MyDatabase.db.rawQuery(sql);
    List<T> models = List();

    for (final node in data) {
      final model = factories[T](node);
      models.add(model);
    }

    return models;
  }
}

