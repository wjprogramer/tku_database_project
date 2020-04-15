import 'package:tkudatabaseproject/repository/table_creator.dart';

abstract class BaseModel {
  BaseModel();

  BaseModel.fromList(List<dynamic> parameters);
  BaseModel.fromJson(Map<String, dynamic> json);
}

class Member extends BaseModel {
  int memberId;
  String idNumber = '';
  String name = '';
  String birthday = '';
  String phone = '';
  String address = '';
  String email = '';
  int introducer;

  Member({
    this.memberId,
    this.idNumber,
    this.name,
    this.birthday,
    this.phone,
    this.address,
    this.email,
    this.introducer,
  });

  Member.fromList(List<dynamic> parameters) {
    int i = 0;
    this.idNumber = parameters[i++];
    this.name = parameters[i++];
    this.birthday = parameters[i++];
    this.phone = parameters[i++];
    this.address = parameters[i++];
    this.email = parameters[i++];
    this.introducer = int.parse(parameters[i++].toString());
  }

  Member.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.memberId = json[MemberTableCreator.MEMBER_ID];
    this.idNumber = json[MemberTableCreator.ID_NUMBER];
    this.name = json[MemberTableCreator.NAME];
    this.birthday = json[MemberTableCreator.BIRTHDAY];
    this.phone = json[MemberTableCreator.PHONE];
    this.address = json[MemberTableCreator.ADDRESS];
    this.email = json[MemberTableCreator.EMAIL];
//    this.introducer = json[MemberTableCreator.INTRODUCER];
  }
}

class Product extends BaseModel {
  String productNumber = '';
  String productName = '';
  String unitPrice = '';
  String category = '';

  Product({
    this.productNumber,
    this.productName,
    this.unitPrice,
    this.category,
  });

  Product.fromList(List<dynamic> parameters) {
    int i = 0;
    this.productName = parameters[i++];
    this.unitPrice = parameters[i++];
    this.category = parameters[i++];
  }

  Product.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Author extends BaseModel {
  String productNumber = '';
  String name = '';

  Author({
    this.productNumber,
    this.name,
  });

  Author.fromList(List<dynamic> parameters) {
    int i = 0;
    this.productNumber = parameters[i++];
    this.name = parameters[i++];
  }

  Author.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Transaction extends BaseModel {
  String transNumber = '';
  String transMember = '';
  String method = '';
  String transTime = '';
  String bankId = '';
  String bankName = '';
  String cardType = '';
  String cardId = '';
  String dueDate = '';

  Transaction({
    this.transNumber,
    this.transMember,
    this.method,
    this.transTime,
    this.bankId,
    this.bankName,
    this.cardType,
    this.cardId,
    this.dueDate,
  });

  Transaction.fromList(List<dynamic> parameters) {
    int i = 0;
    this.transMember = parameters[i++];
    this.method = parameters[i++];
    this.transTime = parameters[i++];
    this.bankId = parameters[i++];
    this.bankName = parameters[i++];
    this.cardType = parameters[i++];
    this.cardId = parameters[i++];
    this.dueDate = parameters[i++];
  }

  Transaction.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Cart extends BaseModel {
  String memberId = '';
  String cartTime = '';
  String transNumber = '';

  Cart({
    this.memberId,
    this.cartTime,
    this.transNumber,
  });

  Cart.fromList(List<dynamic> parameters) {
    int i = 0;
    this.memberId = parameters[i++];
    this.cartTime = parameters[i++];
    this.transNumber = parameters[i++];
  }

  Cart.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Browse extends BaseModel {
  String memberId = '';
  String browseTime = '';
  String productNumber = '';

  Browse({
    this.memberId,
    this.browseTime,
    this.productNumber,
  });

  Browse.fromList(List<dynamic> parameters) {
    int i = 0;
    this.memberId = parameters[i++];
    this.browseTime = parameters[i++];
    this.productNumber = parameters[i++];
  }

  Browse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Order extends BaseModel {
  String memberId = '';
  String cartTime = '';
  String productNumber = '';
  String amount = '';

  Order({
    this.memberId,
    this.cartTime,
    this.productNumber,
    this.amount,
  });

  Order.fromList(List<dynamic> parameters) {
    int i = 0;
    this.memberId = parameters[i++];
    this.cartTime = parameters[i++];
    this.productNumber = parameters[i++];
    this.amount = parameters[i++];
  }

  Order.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Record extends BaseModel {
  String transNumber = '';
  String productNumber = '';
  String amount = '';
  String salePrice = '';

  Record({
    this.transNumber,
    this.productNumber,
    this.amount,
    this.salePrice,
  });

  Record.fromList(List<dynamic> parameters) {
    int i = 0;
    this.transNumber = parameters[i++];
    this.productNumber = parameters[i++];
    this.amount = parameters[i++];
    this.salePrice = parameters[i++];
  }

  Record.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

