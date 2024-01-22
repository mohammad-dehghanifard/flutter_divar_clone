import 'package:flutter_divar_clone/backend/models/user.dart';

class AuthResponse {
  User? user;
  String? token;

  AuthResponse({this.user, this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}


