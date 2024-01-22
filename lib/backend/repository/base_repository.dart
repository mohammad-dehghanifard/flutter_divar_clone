import 'package:dio/dio.dart';

class BaseRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://divar.hitaldev.ir/api",
        validateStatus: (status) {
          return status! < 500;
        },
      contentType: "application/json"
    )
  );
}