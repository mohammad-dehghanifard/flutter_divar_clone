class ResultResponse {
  bool? success;
  String? message;

  ResultResponse.fromJson(Map<String,dynamic> json){
    success = json['success'];
    message = json['message'];
  }
}