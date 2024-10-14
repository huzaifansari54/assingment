import 'dart:io';

import 'package:dio/dio.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/exceptions/dio_exception.dart';
import 'package:softlab/core/exceptions/exceptions.dart';
import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/core/exceptions/failures/failure_model.dart';
import 'package:softlab/core/extentions/dio_extension.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';

abstract interface class $AuthRemoteDataSource {
  Future<void> login({required String email, required String password});
  Future<String> register(UserModelInfo userInfo);
  Future<void> forgetPassword({required String mobile});

  Future<void> verfyOTP({required String otp});
  Future<void> resetPassword(
      {required String token,
      required String password,
      required String cpassword});
}

class AuthRemoteDataSource implements $AuthRemoteDataSource {
  final Dio _client;
  AuthRemoteDataSource(this._client);
  @override
  Future<String> register(UserModelInfo userInfo) async {
    try {
      const endpoint = Endpoint.register;
      final body = userInfo.toJson();
      final response = await _client.post(endpoint,
          data: body, options: Options(headers: Value.headerMultiPartOption()));
      print(body);

      final model = FailureModel.fromJson(response.data);
      if (!model.success) {
        throw AuthException(AuthFailure.unknown(model.message), model);
      }
      print(response.data);
      return response.data["token"];
    } on SocketException {
      throw const AuthException(AuthFailure.interntOut());
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> forgetPassword({required String mobile}) async {
    const endpoint = Endpoint.verfyOTP;
    final body = {"mobile": mobile};
    final response = await _client.post(endpoint,
        data: body, options: Options(headers: Value.headerMultiPartOption()));
    print(body);

    final model = FailureModel.fromJson(response.data);
    if (!model.success) {
      throw AuthException(AuthFailure.unknown(model.message), model);
    }
    print(response.data);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      const endpoint = Endpoint.login;
      final body = {
        "email": email,
        "password": password,
        "role": "farmer",
        "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        "type": "email/facebook/google/apple",
        "social_id": "imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
      };
      final response = await _client.post(endpoint,
          data: body, options: Options(headers: Value.headerMultiPartOption()));
      print(body);

      final model = FailureModel.fromJson(response.data);
      if (!model.success) {
        throw AuthException(AuthFailure.unknown(model.message), model);
      }
      print(response.data);
    } on SocketException {
      throw const AuthException(AuthFailure.interntOut());
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> resetPassword(
      {required String token,
      required String password,
      required String cpassword}) async {
    const endpoint = Endpoint.verfyOTP;
    final body = {"token": token, "password": password, "cpassword": cpassword};
    final response = await _client.post(endpoint,
        data: body, options: Options(headers: Value.headerMultiPartOption()));
    print(body);

    final model = FailureModel.fromJson(response.data);
    if (!model.success) {
      throw AuthException(AuthFailure.unknown(model.message), model);
    }
    print(response.data);
  }

  @override
  Future<void> verfyOTP({required String otp}) async {
    const endpoint = Endpoint.verfyOTP;
    final body = {"otp": otp};
    final response = await _client.post(endpoint,
        data: body, options: Options(headers: Value.headerMultiPartOption()));
    print(body);

    final model = FailureModel.fromJson(response.data);
    if (!model.success) {
      throw AuthException(AuthFailure.unknown(model.message), model);
    }
    print(response.data);
  }
}
