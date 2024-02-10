class ResultResponse {
  bool? bookMark;
  String? message;

  ResultResponse.fromJson(Map<String,dynamic> json){
    bookMark = json['bookmark'];
    message = json['message'];
  }
}