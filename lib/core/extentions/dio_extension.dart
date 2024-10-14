import 'package:dio/dio.dart';

extension $Response on Response {
  bool get Ok => statusCode! <= 201;
}
