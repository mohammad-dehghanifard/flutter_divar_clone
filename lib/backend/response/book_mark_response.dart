class BookMarkResponse {
  bool? bookMark;
  String? message;

  BookMarkResponse.fromJson(Map<String,dynamic> json){
    bookMark = json['bookmark'];
    message = json['message'];
  }
}