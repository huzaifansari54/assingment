import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/core/exceptions/failures/failure_model.dart';
import 'package:softlab/core/exceptions/failures/failures.dart';

class ServerException implements Exception {
  final String message;
  final String status;
  const ServerException({required this.message, required this.status});
}

class ApiException implements Exception {
  final String message;
  final String? status;
  final ApiFailure failure;
  const ApiException(
      {required this.message, required this.status, required this.failure});
}

class AuthException implements Exception {
  final AuthFailure failure;
  final FailureModel? model;
  const AuthException(this.failure, [this.model]);
}
