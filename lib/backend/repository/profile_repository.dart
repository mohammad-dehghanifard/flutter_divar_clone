import 'package:flutter_divar_clone/backend/models/user.dart';
import 'package:flutter_divar_clone/backend/repository/base_repository.dart';

class ProfileRepository extends BaseRepository {
  // get user info
  Future<User> getUserInfo() async {
    final response = await dio.get("/profile");
    validateResponse(response);
    return User.fromJson(response.data['data']);
  }
}