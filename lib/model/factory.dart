import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/model/models.dart';
import 'package:tkudatabaseproject/repository/common_dao.dart';
import 'package:tkudatabaseproject/repository/dao.dart';
import 'package:tkudatabaseproject/repository/table_creator.dart';

final allModelTypes = [Member, Product, Author, Transaction, Cart, Browse, Order, Record];

final iconOf = <Type, IconData>{
  Member: Icons.person,
  Product: Icons.description,
  Author: Icons.edit,
  Transaction: Icons.attach_money,
  Cart: Icons.shopping_cart,
  Browse: Icons.pageview,
  Order: Icons.description,
  Record: Icons.history,
};

final colorOf = <Type, Color>{
  Member: Colors.blueAccent,
  Product: Colors.orangeAccent,
  Author: Colors.redAccent,
  Transaction: Colors.green,
  Cart: Colors.indigo,
  Browse: Colors.brown,
  Order: Colors.lightGreen,
  Record: Colors.deepPurpleAccent,
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

final insertFormColumnNamesOf = <Type, List<String>>{
  Member: ['身分證字號', '姓名', '生日', '電話', '住址', '電子郵件', '介紹人'],
};

final fromJsonOf = <Type, Function>{
  Member: (json) => Member.fromJson(json),
  Product: (json) => Product.fromJson(json),
  Author: (json) => Author.fromJson(json),
  Transaction: (json) => Transaction.fromJson(json),
  Cart: (json) => Cart.fromJson(json),
  Browse: (json) => Browse.fromJson(json),
  Order: (json) => Order.fromJson(json),
  Record: (json) => Record.fromJson(json),
};

//region Database

final insertOf = <Type, Function>{
  Member: (member) => MemberDao.insert(member),
  Product: (product) => ProductDao.insert(product),
  Author: (author) => AuthorDao.insert(author),
  Transaction: (transaction) => TransactionDao.insert(transaction),
  Cart: (cart) => CartDao.insert(cart),
  Browse: (browse) => BrowseDao.insert(browse),
  Order: (order) => OrderDao.insert(order),
  Record: (record) => RecordDao.insert(record),
};

final findAllOf = <Type, Function>{
  Member: () => CommonDAO.findAll<Member>(MemberTableCreator.tableName),
  Product: () => CommonDAO.findAll<Product>(ProductTableCreator.tableName),
  Author: () => CommonDAO.findAll<Author>(AuthorTableCreator.tableName),
  Transaction: () => CommonDAO.findAll<Transaction>(TransactionTableCreator.tableName),
  Cart: () => CommonDAO.findAll<Cart>(CartTableCreator.tableName),
  Browse: () => CommonDAO.findAll<Browse>(BrowseTableCreator.tableName),
  Order: () => CommonDAO.findAll<Order>(OrderTableCreator.tableName),
  Record: () => CommonDAO.findAll<Record>(RecordTableCreator.tableName),
};

final getOf = <Type, Function>{
  Member: (id) => MemberDao.get(id),
  Product: (id) => ProductDao.get(id),
  Author: (id) => AuthorDao.get(id),
  Transaction: (id) => TransactionDao.get(id),
  Cart: (id) => CartDao.get(id),
  Browse: (id) => BrowseDao.get(id),
  Order: (id) => OrderDao.get(id),
  Record: (id) => RecordDao.get(id),
};

final updateOf = <Type, Function>{
  Member: (member) => MemberDao.update(member),
  Product: (product) => ProductDao.update(product),
  Author: (author) => AuthorDao.update(author),
  Transaction: (transaction) => TransactionDao.update(transaction),
  Cart: (cart) => CartDao.update(cart),
  Browse: (browse) => BrowseDao.update(browse),
  Order: (order) => OrderDao.update(order),
  Record: (record) => RecordDao.update(record),
};

final deleteOf = <Type, Function>{
  Member: (id) => MemberDao.delete(id),
  Product: (id) => ProductDao.delete(id),
  Author: (id) => AuthorDao.delete(id),
  Transaction: (id) => TransactionDao.delete(id),
  Cart: (id) => CartDao.delete(id),
  Browse: (id) => BrowseDao.delete(id),
  Order: (id) => OrderDao.delete(id),
  Record: (id) => RecordDao.delete(id),
};

//endregion

