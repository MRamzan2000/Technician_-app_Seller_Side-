
class Order {
  final String id;
  final String customerId;
  final String sellerId;
  final String type;
  final DateTime date;
  final String day;
  final String time;
  final List<int> image;
  final String amount;
  final String updatedamount;
  final String address;
  final String status;
  final DateTime timestamp;
  final String username;

  Order( {
    required this.address,
    required this.username,
    required this.id,
    required this.customerId,
    required this.sellerId,
    required this.type,
    required this.date,
    required this.day,
    required this.time,
    required this.image,
    required this.amount,
    required this.updatedamount,


    required this.status,
    required this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      username: json['username'],
      id: json['_id'],
      customerId: json['userId'],
      sellerId: json['sellerId'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      day: json['day'],
      time: json['time'],
      image: List<int>.from(json['image']['data']),
      amount: json['amount'],
      status: json['status'],
      timestamp: DateTime.parse(json['timestamp']),
      updatedamount: json["updatedAmount"], address: json["address"],
    );
  }
}

class OrderList {
  final List<Order> orders;

  OrderList({
    required this.orders,
  });

  factory OrderList.fromJson(List<dynamic> json) {
    List<Order> orders = [];
    orders = json.map((order) => Order.fromJson(order)).toList();
    return OrderList(orders: orders);
  }
}