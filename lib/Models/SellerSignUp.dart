class SellerSignUp {
  final String? message;
  final String? error;

  SellerSignUp({ this.error,this.message});

  factory SellerSignUp.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('error')){
      return SellerSignUp(
        error: json['error'],
      );
    }
    return SellerSignUp(
      message: json['message'],
    );
  }
}