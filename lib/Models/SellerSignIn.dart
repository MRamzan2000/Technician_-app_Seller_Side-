class SignInResponse {
  final String? riderId;
  final String? token;
  final String? message;

  SignInResponse({ this.riderId, this.token,this.message});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      return SignInResponse(
        riderId: json['id'],
        token: json['token'],
      );
    } else {
      return SignInResponse(
        message: json['message'],
      );
    }
  }
}
