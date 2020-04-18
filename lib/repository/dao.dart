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
      product.productName.toString(),
      product.unitPrice.toString(),
      product.category.toString(),
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

  static Future<void> update(Product product) async {
    final sql = '''
      UPDATE ${ProductTableCreator.tableName}
      SET 
        ${ProductTableCreator.PRODUCT_NAME} = ?,
        ${ProductTableCreator.UNIT_PRICE} = ?,
        ${ProductTableCreator.CATEGORY} = ?
      WHERE ${ProductTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      product.productName,
      product.unitPrice,
      product.category,
      product.productNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Product', sql, null, result, params);
  }
}

class AuthorDao extends CommonDAO {
  static Future<Author> get(int pNo) async {
    final sql = '''SELECT * FROM ${AuthorTableCreator.tableName}
    WHERE ${AuthorTableCreator.PRODUCT_NUMBER} = ?''';

    List<dynamic> params = [
      pNo
    ];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Author.fromJson(data.first);
    return todo;
  }

  static Future<void> insert(Author author) async {
    final sql = '''INSERT INTO ${AuthorTableCreator.tableName}
    (
      ${AuthorTableCreator.PRODUCT_NUMBER},
      ${AuthorTableCreator.NAME}
    )
    VALUES (?,?)
    ''';

    List<dynamic> params = [
      author.productNumber,
      author.name
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Authorp', sql, null, result, params);
  }

  static Future<void> delete(int pNo) async {
    final sql = '''
      DELETE FROM ${AuthorTableCreator.tableName}
      WHERE ${AuthorTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      pNo
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Author', sql, null, result, params);
  }

  static Future<void> update(Author author) async {
    final sql = '''
      UPDATE ${AuthorTableCreator.tableName}
      SET 
        ${AuthorTableCreator.PRODUCT_NUMBER} = ?,
        ${AuthorTableCreator.NAME} = ?
      WHERE ${AuthorTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      author.productNumber,
      author.name,
      author.productNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Author', sql, null, result, params);
  }
}

class TransactionDao extends CommonDAO {
  static Future<Transaction>get(int id) async {

  }

  static Future<int> insert(Transaction transaction) async {
    final sql = '''INSERT INTO ${TransactionTableCreator.tableName}
    (
      ${TransactionTableCreator.TRANS_MEMBER},
      ${TransactionTableCreator.METHOD},
      ${TransactionTableCreator.TRANS_TIME},
      ${TransactionTableCreator.BANK_ID},
      ${TransactionTableCreator.BANK_NAME},
      ${TransactionTableCreator.CARD_TYPE},
      ${TransactionTableCreator.CARD_ID},
      ${TransactionTableCreator.DUE_DATE}
    )
    VALUES (?,?,?,?,?,  ?,?,?)''';

    List<dynamic> params = [
      transaction.transMember,
      transaction.method,
      transaction.transTime,
      transaction.bankId,
      transaction.bankName,
      transaction.cardType,
      transaction.cardId,
      transaction.dueDate,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Transaction', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
      DELETE FROM ${TransactionTableCreator.tableName}
      WHERE ${TransactionTableCreator.TRANS_NUMBER} = ?
    ''';

    List<dynamic> params = [
      groupId
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Transaction', sql, null, result, params);
  }
  static Future<void> update(Transaction transaction) async {
    final sql = '''
      UPDATE ${TransactionTableCreator.tableName}
      SET
        ${TransactionTableCreator.TRANS_MEMBER} = ?,
        ${TransactionTableCreator.METHOD} = ?,
        ${TransactionTableCreator.TRANS_TIME} = ?,
        ${TransactionTableCreator.BANK_ID} = ?,
        ${TransactionTableCreator.BANK_NAME} = ?,
        ${TransactionTableCreator.CARD_TYPE} = ?,
        ${TransactionTableCreator.CARD_ID} = ?,
        ${TransactionTableCreator.DUE_DATE} = ?,
      WHERE ${TransactionTableCreator.TRANS_NUMBER} = ?
    ''';

    List<dynamic> params = [
      transaction.transMember,
      transaction.method,
      transaction.transTime,
      transaction.bankId,
      transaction.bankName,
      transaction.cardType,
      transaction.cardId,
      transaction.dueDate,
      transaction.transNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Transaction', sql, null, result, params);
  }
}

class CartDao extends CommonDAO {
  static Future<Cart> get(int memberId, int transNumber) async {
    final sql = '''SELECT * FROM ${CartTableCreator.tableName}
    WHERE ${CartTableCreator.MEMBER_ID} = ? AND ${CartTableCreator.TRANS_NUMBER} = ?''';

    List<dynamic> params = [
      memberId,
      transNumber,
    ];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Cart.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Cart group) async {
    final sql = '''INSERT INTO ${CartTableCreator.tableName}
    (
      ${CartTableCreator.MEMBER_ID},
      ${CartTableCreator.CART_TIME},
      ${CartTableCreator.TRANS_NUMBER}
    )
    VALUES (?,?,?)''';

    List<dynamic> params = [
      group.memberId,
      group.cartTime,
      group.transNumber,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Cart', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int memberId, int transNumber) async {
    final sql = '''
    DELETE FROM ${CartTableCreator.tableName}
    WHERE ${CartTableCreator.MEMBER_ID} = ? AND ${CartTableCreator.TRANS_NUMBER} = ?
    ''';

    List<dynamic> params = [
      memberId,
      transNumber,
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Cart', sql, null, result, params);
  }

  static Future<void> update(Cart cart) async {
    final sql = '''
    UPDATE ${CartTableCreator.tableName}
    SET
      ${CartTableCreator.MEMBER_ID} = ?,
      ${CartTableCreator.CART_TIME} = ?,
      ${CartTableCreator.TRANS_NUMBER} = ?
    WHERE ${CartTableCreator.MEMBER_ID} = ? AND ${CartTableCreator.TRANS_NUMBER} = ?
    ''';

    List<dynamic> params = [
      cart.memberId,
      cart.cartTime,
      cart.transNumber,
      cart.memberId,
      cart.transNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Cart', sql, null, result, params);
  }
}

class BrowseDao extends CommonDAO {
  static Future<Browse> get(int id) async {
    final sql = '''SELECT * FROM ${BrowseTableCreator.tableName}
    WHERE ${BrowseTableCreator.MEMBER_ID} = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Browse.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Browse group) async {
    final sql = '''INSERT INTO ${BrowseTableCreator.tableName}
    ( 
      ${BrowseTableCreator.MEMBER_ID},
      ${BrowseTableCreator.BROWSE_TIME},
      ${BrowseTableCreator.PRODUCT_NUMBER}
    )
    VALUES (?,?,?)''';

    List<dynamic> params = [
      group.memberId,
      group.browseTime,
      group.productNumber,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Browse', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int groupId) async {
    final sql = '''
    DELETE FROM ${BrowseTableCreator.tableName}
    WHERE ${BrowseTableCreator.MEMBER_ID} = ?
    ''';

    List<dynamic> params = [
      groupId,
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Browse', sql, null, result, params);
  }

  static Future<void> update(Browse member) async {
    final sql = '''
    UPDATE ${BrowseTableCreator.tableName}
    SET
      ${BrowseTableCreator.MEMBER_ID} = ?,
      ${BrowseTableCreator.BROWSE_TIME} = ?,
      ${BrowseTableCreator.PRODUCT_NUMBER} = ?
    WHERE ${BrowseTableCreator.MEMBER_ID} = ? AND ${BrowseTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      member.memberId,
      member.browseTime,
      member.productNumber,
      member.memberId,
      member.productNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Browse', sql, null, result, params);
  }
}

class OrderDao extends CommonDAO {
  static Future<Order> get(int id) async {
    final sql = '''SELECT * FROM ${OrderTableCreator.tableName}
    WHERE ${OrderTableCreator.MEMBER_ID} = ?''';

    List<dynamic> params = [id];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Order.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Order order) async {
    final sql = '''INSERT INTO ${OrderTableCreator.tableName}
    (
      ${OrderTableCreator.MEMBER_ID},
      ${OrderTableCreator.CART_TIME},
      ${OrderTableCreator.PRODUCT_NUMBER},
      ${OrderTableCreator.AMOUNT}
    )
    VALUES (?,?,?,?)''';

    List<dynamic> params = [
      order.memberId,
      order.cartTime,
      order.productNumber,
      order.amount
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Order', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int memberId, String cartTime, int productNumber) async {
    final sql = '''
    DELETE FROM ${OrderTableCreator.tableName}
    WHERE 
      ${OrderTableCreator.MEMBER_ID} = ? AND
      ${OrderTableCreator.CART_TIME} = ? AND
      ${OrderTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      memberId,
      cartTime,
      productNumber,
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Order', sql, null, result, params);
  }

  static Future<void> update(Order order) async {
    final sql = '''
    UPDATE ${OrderTableCreator.tableName}
    SET
      ${OrderTableCreator.AMOUNT} = ?
    WHERE
      ${OrderTableCreator.MEMBER_ID} = ? AND
      ${OrderTableCreator.CART_TIME} = ? AND
      ${OrderTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      order.amount,
      order.memberId,
      order.cartTime,
      order.productNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Order', sql, null, result, params);
  }
}

class RecordDao extends CommonDAO {
  static Future<Record> get(int transNumber, int productNumber) async {
    final sql = '''SELECT * FROM ${RecordTableCreator.tableName}
    WHERE 
      ${RecordTableCreator.TRANS_NUMBER} = ? AND
      ${RecordTableCreator.PRODUCT_NUMBER} = ?  
    ''';

    List<dynamic> params = [
      transNumber,
      productNumber,
    ];
    final data = await MyDatabase.db.rawQuery(sql, params);

    final todo = Record.fromJson(data.first);
    return todo;
  }

  static Future<int> insert(Record record) async {
    final sql = '''INSERT INTO ${RecordTableCreator.tableName}
    (
      ${RecordTableCreator.TRANS_NUMBER},
      ${RecordTableCreator.PRODUCT_NUMBER},
      ${RecordTableCreator.AMOUNT},
      ${RecordTableCreator.SALE_PRICE}
    )
    VALUES (?,?,?,?)''';

    List<dynamic> params = [
      record.transNumber,
      record.productNumber,
      record.amount,
      record.salePrice,
    ];

    final int result = await MyDatabase.db.rawInsert(sql, params);
    MyDatabase.databaseLog('Insert Record', sql, null, result, params);
    return result;
  }

  static Future<void> delete(int transNumber, int productNumber) async {
    final sql = '''
    DELETE FROM ${RecordTableCreator.tableName}
    WHERE 
      ${RecordTableCreator.TRANS_NUMBER} = ? AND
      ${RecordTableCreator.PRODUCT_NUMBER} = ?      
    ''';

    List<dynamic> params = [
      transNumber,
      productNumber
    ];

    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Delete Record', sql, null, result, params);
  }

  static Future<void> update(Record record) async {
    final sql = '''
    UPDATE ${RecordTableCreator.tableName}
    SET
      ${RecordTableCreator.AMOUNT} = ?,
      ${RecordTableCreator.SALE_PRICE} = ?
    WHERE 
      ${RecordTableCreator.TRANS_NUMBER} = ? AND
      ${RecordTableCreator.PRODUCT_NUMBER} = ?
    ''';

    List<dynamic> params = [
      record.amount,
      record.salePrice,
      record.transNumber,
      record.productNumber,
    ];
    final result = await MyDatabase.db.rawUpdate(sql, params);

    MyDatabase.databaseLog('Update Record', sql, null, result, params);
  }
}