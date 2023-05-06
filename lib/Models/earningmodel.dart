class EarningModel {
  final String? message;
  final String? error;

  EarningModel({ this.error,this.message});

  factory EarningModel.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('error')){
      return EarningModel(
        error: json['error'],
      );
    }
    return EarningModel(
      message: json['message'] ["earnings"].toString() ,

    );
  }
}