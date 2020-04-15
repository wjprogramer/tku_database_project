import 'package:tkudatabaseproject/model/factory.dart';
import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/repository/database_creator.dart';

class CommonDAO {
  static Future<void> dropTable(String tableName) async {
    print('DROP TABLE');
    final sql = '''DROP TABLE IF EXISTS $tableName''';
    await MyDatabase.db.execute(sql);
  }

  static Future<void> clearTable(String tableName) async {
    print('CLEAR TABLE');
    final sql = '''DELETE FROM $tableName''';
    await MyDatabase.db.execute(sql);
  }

  static Future<List<T>> findAll<T extends BaseModel>(String tableName) async {
    final sql = '''SELECT * FROM ${tableNameOf[T]}''';

    final data = await MyDatabase.db.rawQuery(sql);
    List<T> models = List();

    for (final node in data) {
      final model = fromJsonOf[T](node);
      models.add(model);
    }

    return models;
  }
}

