import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/repository/common_dao.dart';
import 'package:tkudatabaseproject/repository/database_creator.dart';
import 'package:tkudatabaseproject/repository/table_creator.dart';

class MemberDao extends CommonDAO {
  static Future<Member> get(int id) async {
    final sql = '''SELECT * FROM ${MemberTableCreator.tableName}
    WHERE ${MemberTableCreator.MEMBER_ID} = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final member = Member.fromJson(data.first);
    return member;
  }

  static Future<int> insert(Member member) async {
    final sql = '''INSERT INTO ${MemberTableCreator.tableName}
    (
      ${MemberTableCreator.ID_NUMBER},
      ${MemberTableCreator.NAME},
      ${MemberTableCreator.BIRTHDAY},
      ${MemberTableCreator.PHONE},
      ${MemberTableCreator.ADDRESS},
      ${MemberTableCreator.EMAIL},
      ${MemberTableCreator.INTRODUCER}
    )
    VALUES (?,?,?,?,?,?,?)''';

    List<dynamic> params = [
      member.idNumber,
      member.name,
      member.birthday,
      member.phone,
      member.address,
      member.email,
      member.introducer,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Member', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int id) async {
    final sql = '''
      DELETE FROM ${MemberTableCreator.tableName}
      WHERE ${MemberTableCreator.MEMBER_ID} = ?
    ''';

    List<dynamic> params = [
      id
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Member', sql, null, result, params);
  }

  static Future<void> update(Member member) async {
    final sql = '''
      UPDATE ${MemberTableCreator.tableName}
      SET 
        ${MemberTableCreator.ID_NUMBER} = ?,
        ${MemberTableCreator.NAME} = ?,
        ${MemberTableCreator.BIRTHDAY} = ?,
        ${MemberTableCreator.PHONE} = ?,
        ${MemberTableCreator.ADDRESS} = ?,
        ${MemberTableCreator.EMAIL} = ?,
        ${MemberTableCreator.INTRODUCER} = ?
      WHERE ${MemberTableCreator.MEMBER_ID} = ?
    ''';

    List<dynamic> params = [
      member.idNumber,
      member.name,
      member.birthday,
      member.phone,
      member.address,
      member.email,
      member.introducer,
      member.memberId,
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Member', sql, null, result, params);
  }
}

class ProductDao extends CommonDAO {
  static Future<Product> get(int pNo) async {
    final sql = '''SELECT * FROM ${ProductTableCreator.tableName}
    WHERE ${ProductTableCreator.PRODUCT_NUMBER} = ?''';

    List<dynamic> params = [pNo];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Product.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Product product) async {
    final sql = '''INSERT INTO ${ProductTableCreator.tableName}
    (
      ${ProductTableCreator.PRODUCT_NAME},
      ${ProductTableCreator.UNIT_PRICE},
      ${ProductTableCreator.CATEGORY}
    )
    VALUES (?,?,?)''';

    List<dynamic> params = [
      product.productName,
      product.unitPrice,
      product.category,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Product', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int pNo) async {
    final sql = '''
      DELETE FROM ${ProductTableCreator.tableName}
      WHERE ${ProductTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [pNo];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Product', sql, null, result, params);
  }

  static Future<void> update(Product member) async {
    final sql = '''
      UPDATE ${ProductTableCreator.tableName}
      SET 
        __ = ?,
      WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Product', sql, null, result, params);
  }
}

class AuthorDao extends CommonDAO {
  static Future<Author> get(int id) async {
    final sql = '''SELECT * FROM ${AuthorTableCreator.tableName}
    WHERE ___ = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Author.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${AuthorTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Authorp', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
      DELETE FROM ${AuthorTableCreator.tableName}
      WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Author', sql, null, result, params);
  }

  static Future<void> update(Author member) async {
    final sql = '''
      UPDATE ${AuthorTableCreator.tableName}
      SET 
        __ = ?,
      WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Author', sql, null, result, params);
  }
}

class TransactionDao extends CommonDAO {
  static Future<Transaction>get(int id) async {

  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${TransactionTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('  Group', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
      DELETE FROM ${MemberTableCreator.tableName}
      WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Group', sql, null, result, params);
  }
  static Future<void> update(Member member) async {
    final sql = '''
      UPDATE ${MemberTableCreator.tableName}
      SET           __ = ?,
    WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Group', sql, null, result, params);
  }
}

class CartDao extends CommonDAO {
  static Future<Cart> get(int id) async {
    final sql = '''SELECT * FROM ${CartTableCreator.tableName}
    WHERE ___ = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Cart.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${CartTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Cartoup', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
    DELETE FROM ${CartTableCreator.tableName}
    WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Cart Group', sql, null, result, params);
  }

  static Future<void> update(Member member) async {
    final sql = '''
    UPDATE ${CartTableCreator.tableName}
    SET
    __ = ?,
    WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Cart', sql, null, result, params);
  }
}

class BrowseDao extends CommonDAO {
  static Future<Browse> get(int id) async {
    final sql = '''SELECT * FROM ${BrowseTableCreator.tableName}
    WHERE ___ = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Browse.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${BrowseTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Browsep', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
    DELETE FROM ${BrowseTableCreator.tableName}
    WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Browse', sql, null, result, params);
  }

  static Future<void> update(Browse member) async {
    final sql = '''
    UPDATE ${BrowseTableCreator.tableName}
    SET
    __ = ?,
    WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Browse', sql, null, result, params);
  }
}

class OrderDao extends CommonDAO {
  static Future<Order> get(int id) async {
    final sql = '''SELECT * FROM ${OrderTableCreator.tableName}
    WHERE ___ = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Order.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${OrderTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Orderup', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
    DELETE FROM ${OrderTableCreator.tableName}
    WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Order Group', sql, null, result, params);
  }

  static Future<void> update(Member member) async {
    final sql = '''
    UPDATE ${OrderTableCreator.tableName}
    SET
    __ = ?,
    WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Order', sql, null, result, params);
  }
}

class RecordDao extends CommonDAO {
  static Future<Record> get(int id) async {
    final sql = '''SELECT * FROM ${RecordTableCreator.tableName}
    WHERE ___ = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Record.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Member group) async {
    final sql = '''INSERT INTO ${RecordTableCreator.tableName}
    (
    )
    VALUES (?,?,?,?,?)''';

    List<dynamic> params = [
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Recordp', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
    DELETE FROM ${RecordTableCreator.tableName}
    WHERE ___ = ?
    ''';

    List<dynamic> params = [
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Record', sql, null, result, params);
  }

  static Future<void> update(Record member) async {
    final sql = '''
    UPDATE ${RecordTableCreator.tableName}
    SET
    __ = ?,
    WHERE __ = ?
    ''';

    List<dynamic> params = [
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Record', sql, null, result, params);
  }
}