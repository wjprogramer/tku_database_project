import 'package:sqflite/sqflite.dart';

abstract class TableCreator {

}

class MemberTableCreator extends TableCreator {
  static const tableName = 'Member';

  static const MEMBER_ID = 'mId';
  static const ID_NUMBER = 'pId';
  static const NAME = 'name';
  static const BIRTHDAY = 'birthday';
  static const PHONE = 'phone';
  static const ADDRESS = 'address';
  static const EMAIL = 'email';
  static const INTRODUCER = 'introducer';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $MEMBER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $ID_NUMBER TEXT,
      $NAME TEXT,
      $BIRTHDAY TEXT,
      $PHONE TEXT,
      $ADDRESS TEXT,
      $EMAIL TEXT,
      $INTRODUCER TEXT
    )''';

    await db.execute(todoSql);
  }
}

class ProductTableCreator extends TableCreator {
  static const tableName = 'Product';

  static const PRODUCT_NUMBER = 'pNo';
  static const PRODUCT_NAME = 'pName';
  static const UNIT_PRICE = 'unitPrice';
  static const CATEGORY = 'category';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $PRODUCT_NUMBER INTEGER PRIMARY KEY AUTOINCREMENT,
      $PRODUCT_NAME TEXT,
      $UNIT_PRICE TEXT,
      $CATEGORY TEXT
    )''';

    await db.execute(todoSql);
  }
}

class AuthorTableCreator extends TableCreator {
  static const tableName = 'Author';

  static const PRODUCT_NUMBER = 'pNo';
  static const NAME = 'name';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $PRODUCT_NUMBER INTEGER,
      $NAME TEXT,
      PRIMARY KEY ($PRODUCT_NUMBER, $NAME)
    )''';

    await db.execute(todoSql);
  }
}

class TransactionTableCreator extends TableCreator {
  static const tableName = 'Transactions';

  static const TRANS_NUMBER = 'tId';
  static const TRANS_MEMBER = 'transMid';
  static const METHOD = 'method';
  static const TRANS_TIME = 'transTime';
  static const BANK_ID = 'bankId';
  static const BANK_NAME = 'bankName';
  static const CARD_TYPE = 'cardType';
  static const CARD_ID = 'cardId';
  static const DUE_DATE = 'dueDate';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $TRANS_NUMBER INTEGER PRIMARY KEY AUTOINCREMENT,
      $TRANS_MEMBER TEXT,
      $METHOD TEXT,
      $TRANS_TIME TEXT,
      $BANK_ID TEXT,
      $BANK_NAME TEXT,
      $CARD_TYPE TEXT,
      $CARD_ID TEXT,
      $DUE_DATE TEXT
    )''';

    await db.execute(todoSql);
  }
}

class CartTableCreator extends TableCreator {
  static const tableName = 'Cart';

  static const MEMBER_ID = 'mId';
  static const CART_TIME = 'cartTime';
  static const TRANS_NUMBER = 'tNo';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $MEMBER_ID INTEGER,
      $CART_TIME TEXT,
      $TRANS_NUMBER INTEGER,
      PRIMARY KEY ($MEMBER_ID, $CART_TIME)
    )''';

    await db.execute(todoSql);
  }
}

class BrowseTableCreator extends TableCreator {
  static const tableName = 'Browse';

  static const MEMBER_ID = 'mId';
  static const CART_TIME = 'cartTime';
  static const PRODUCT_NUMBER = 'pNo';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $MEMBER_ID INTEGER,
      $CART_TIME TEXT,
      $PRODUCT_NUMBER INTEGER,
      PRIMARY KEY ($MEMBER_ID, $CART_TIME, $PRODUCT_NUMBER)
    )''';

    await db.execute(todoSql);
  }
}

class OrderTableCreator extends TableCreator {
  static const tableName = 'Orders';

  static const MEMBER_ID = 'mId';
  static const CART_TIME = 'cartTime';
  static const PRODUCT_NUMBER = 'pNo';
  static const AMOUNT = 'amount';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $MEMBER_ID INTEGER,
      $CART_TIME TEXT,
      $PRODUCT_NUMBER INTEGER,
      $AMOUNT INTEGER,
      PRIMARY KEY ($MEMBER_ID, $CART_TIME, $PRODUCT_NUMBER)
    )''';

    await db.execute(todoSql);
  }
}

class RecordTableCreator extends TableCreator {
  static const tableName = 'Record';

  static const TRANS_NUMBER = 'tNo';
  static const PRODUCT_NUMBER = 'pNo';
  static const AMOUNT = 'amount';
  static const SALE_PRICE = 'sale_price';

  static Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $TRANS_NUMBER INTEGER,
      $PRODUCT_NUMBER INTEGER,
      $AMOUNT INTEGER,
      $SALE_PRICE INTEGER,
      PRIMARY KEY ($TRANS_NUMBER, $PRODUCT_NUMBER)
    )''';

    await db.execute(todoSql);
  }
}
