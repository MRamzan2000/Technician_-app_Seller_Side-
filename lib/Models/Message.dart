class Message {
  final String? text;
  final String? senderId;
  final String? error;
  final String? receiverId;

  Message({ this.senderId,this.text,this.receiverId,this.error});

  factory Message.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('error')){
      return Message(
        error: json['error'],
      );
    }
    return Message(
      text: json['text'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
    );
  }
}