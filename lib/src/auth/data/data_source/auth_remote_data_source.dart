import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/exceptions/dio_exception.dart';
import 'package:softlab/core/exceptions/exceptions.dart';
import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/core/exceptions/failures/failure_model.dart';
import 'package:softlab/core/extentions/dio_extension.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';

abstract interface class $AuthRemoteDataSource {
  Future<String> login({
    required String email,
    required String password,
    String? socialId,
    String? type,
  });
  Future<String> register(UserModelInfo userInfo);
  Future<String> loginWithApple();
  Future<String> loginWithGoogle();
  Future<String> loginWithFacebook();
  Future<void> forgetPassword({required String mobile});
  Future<void> verfyOTP({required String otp});
  Future<void> resetPassword(
      {required String token,
      required String password,
      required String cpassword});
}

class AuthRemoteDataSource implements $AuthRemoteDataSource {
  final Dio _client;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseAuth _firebaseAuth;

  const AuthRemoteDataSource(
      this._client, this._googleSignIn, this._facebookAuth, this._firebaseAuth);
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
    } on AuthException catch (e) {
      throw AuthException(e.failure);
    } catch (ex) {
      throw AuthException(AuthFailure.unknown(ex.toString()));
    }
  }

  @override
  Future<void> forgetPassword({required String mobile}) async {
    try {
      const endpoint = Endpoint.forgetPassword;
      final body = {"mobile": mobile};
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
    } on AuthException catch (e) {
      throw AuthException(e.failure);
    } catch (ex) {
      throw AuthException(AuthFailure.unknown(ex.toString()));
    }
  }

  @override
  Future<String> login(
      {required String email,
      required String password,
      String? socialId,
      String? type}) async {
    try {
      const endpoint = Endpoint.login;
      final body = {
        "email": email,
        "password": password,
        "role": "farmer",
        "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        "type": type ?? "email/facebook/google/apple",
        "social_id": socialId ?? "imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
      };
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
    } on AuthException catch (e) {
      throw AuthException(e.failure);
    } catch (ex) {
      throw AuthException(AuthFailure.unknown(ex.toString()));
    }
  }

  @override
  Future<void> resetPassword(
      {required String token,
      required String password,
      required String cpassword}) async {
    try {
      const endpoint = Endpoint.verfyOTP;
      final body = {
        "token": token,
        "password": password,
        "cpassword": cpassword
      };
      final response = await _client.post(endpoint,
          data: body, options: Options(headers: Value.headerMultiPartOption()));
      print(body);

      final model = FailureModel.fromJson(response.data);
      if (!model.success) {
        throw AuthException(AuthFailure.unknown(model.message), model);
      }
      print(response.data);
    } catch (ec) {
      throw AuthException(AuthFailure.server(ec.toString()));
    }
  }

  @override
  Future<void> verfyOTP({required String otp}) async {
    try {
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
    } on AuthException catch (e) {
      throw AuthException(e.failure);
    } catch (ex) {
      throw AuthException(AuthFailure.unknown(ex.toString()));
    }
  }

  @override
  Future<String> loginWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<String> loginWithFacebook() async {
    try {
      final result = await _facebookAuth.login();
      if (result.status != LoginStatus.success) {
        throw AuthFailure.server('${result.message!}${result.message}');
      }
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await _firebaseAuth.signInWithCredential(credential);
      return result.accessToken!.token;
    } on SocketException {
      throw const AuthException(AuthFailure.interntOut());
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    } catch (ec) {
      throw AuthException(AuthFailure.server(ec.toString()));
    }
  }

  @override
  Future<String> loginWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        throw const AuthException(AuthFailure.server("user cancel"));
      }
      final auth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
          idToken: auth.idToken, accessToken: auth.accessToken);
      await _firebaseAuth.signInWithCredential(credential);

      return user.id;
    } on SocketException {
      throw const AuthException(AuthFailure.interntOut());
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    } catch (ec) {
      throw AuthException(AuthFailure.server(ec.toString()));
    }
  }
}
