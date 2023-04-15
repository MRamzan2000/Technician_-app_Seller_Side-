class Transaction {
  String? seller;
  int? amount;
  String? method;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? version;

  Transaction({
    this.seller,
    this.amount,
    this.method,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('messagee')){
      return Transaction(
          seller: json['message'] as String?,
      );
    }
    return Transaction(
      seller: json['message']['seller'] as String?,
      amount: json['message']['amount'] as int?,
      method: json['message']['method'] as String?,
      id: json['message']['_id'] as String?,
      createdAt: DateTime.parse(json['message']['createdAt'] as String? ?? ''),
      updatedAt: DateTime.parse(json['message']['updatedAt'] as String? ?? ''),
      version: json['message']['__v'] as int?,
    );
  }
}
