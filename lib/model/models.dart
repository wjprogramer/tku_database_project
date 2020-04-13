abstract class BaseModel {
  BaseModel();

  BaseModel.fromJson(Map<String, dynamic> json);
}

class Member extends BaseModel {
  String memberId = '';
  String idNumber = '';
  String name = '';
  String birthday = '';
  String phone = '';
  String address = '';
  String email = '';
  String introducer = '';

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

  Member.fromJson(Map<String, dynamic> json) : super.fromJson(json);
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

  Product.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Author extends BaseModel {
  String productNumber = '';
  String name = '';

  Author({
    this.productNumber,
    this.name,
  });

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

  Cart.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Browse extends BaseModel {
  String memberId = '';
  String cartTime = '';
  String productNumber = '';

  Browse({
    this.memberId,
    this.cartTime,
    this.productNumber,
  });

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

  Record.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

