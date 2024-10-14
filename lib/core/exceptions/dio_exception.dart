import 'package:dio/dio.dart';
import 'package:softlab/core/exceptions/failures/failures.dart';

import '../../lc.dart';
import 'exceptions.dart';


ApiFailure dioErrorHandler(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout => const ApiFailure.timeout(),
    DioExceptionType.cancel =>
      const ApiFailure.serverFailed(message: "request cancel"),
    DioExceptionType.badResponse =>
      const ApiFailure.serverFailed(message: "Bad Request"),
    DioExceptionType.badCertificate =>
      const ApiFailure.serverFailed(message: "Bad certificate"),
    DioExceptionType.connectionError => const ApiFailure.internetOut(),
    DioExceptionType.receiveTimeout => const ApiFailure.timeout(),
    DioExceptionType.sendTimeout => const ApiFailure.timeout(),
    DioExceptionType.unknown => throw const ApiException(
        failure: ApiFailure.serverFailed(message: "Unknow"),
        message: "Unknown",
        status: "400")
  };
}

Never dioExceptionHandling(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout => throw ApiException(
        failure: const ApiFailure.timeout(),
        message: e.message ?? "Unknow cause",
        status: e.error.toString()),
    DioExceptionType.cancel => throw ApiException(
        failure: const ApiFailure.serverFailed(message: "Request cancel"),
        message: e.message ?? "unknow cause",
        status: e.error.toString()),
    DioExceptionType.badResponse => throw ApiException(
        failure: const ApiFailure.serverFailed(message: "Bad request"),
        message: e.message ?? "unknow cause",
        status: e.error.toString()),
    DioExceptionType.badCertificate => throw ApiException(
        failure: const ApiFailure.serverFailed(message: "Bad certificate"),
        message: e.message ?? "unknow cause",
        status: e.error.toString()),
    DioExceptionType.connectionError => throw DioException.connectionError(
        requestOptions: e.requestOptions,
        reason: "internet Connection is Lost"),
    DioExceptionType.receiveTimeout => throw DioException.receiveTimeout(
        requestOptions: e.requestOptions,
        timeout: timoutDuration,
      ),
    DioExceptionType.sendTimeout => throw DioException.sendTimeout(
        requestOptions: e.requestOptions, timeout: timoutDuration),
    DioExceptionType.unknown => throw const ApiException(
        failure: ApiFailure.serverFailed(message: "Unknow"),
        message: "Unknown",
        status: "400")
  };
}
