class Transactions {
  String? id;
  String? seller;
  String? amount;
  String? method;
  String? createdAt;

  Transactions({
    this.id,
    this.seller,
    this.amount,
    this.method,
    this.createdAt,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    print(json['_id']);
    print(json['seller']);
    print(json['amount']);
    print(json['method']);
    print(json['createdAt']);
    return Transactions(
      id: json['_id'] as String?,
      seller: json['seller'] as String?,
      amount: json['amount'].toString(),
      method: json['method'] as String?,
      createdAt: json['createdAt'],
    );
  }
}

class TransactionList {
  List<Transactions>? transactions;

  TransactionList({this.transactions});

  factory TransactionList.fromJson(List<dynamic> json) {
    List<Transactions> transactions = [];
    transactions = json.map((order) => Transactions.fromJson(order)).toList();
    return TransactionList(transactions: transactions);
  }
}
