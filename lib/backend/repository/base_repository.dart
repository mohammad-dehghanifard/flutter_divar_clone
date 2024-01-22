import 'package:dio/dio.dart';

class BaseRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://divar.hitaldev.ir/api",
      contentType: "application/json"
    )
  );
}