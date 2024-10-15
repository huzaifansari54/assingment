import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/exceptions/exceptions.dart';
import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/core/exceptions/failures/failures.dart';
import 'package:softlab/src/auth/data/data_source/auth_local_data_souece.dart';
import 'package:softlab/src/auth/data/data_source/auth_remote_data_source.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepository implements $AuthRepository {
  final $AuthRemoteDataSource _remoteDataSource;
  final $AuthLocalDataSource _localDataSource;

  AuthRepository(
      {required $AuthRemoteDataSource remoteDataSource,
      required $AuthLocalDataSource localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  TaskEither<AuthFailure, Unit> register(UserModelInfo userModelInfo) {
    return TaskEither.tryCatch(() => _remoteDataSource.register(userModelInfo),
        (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).flatMap((f) {
      return TaskEither.tryCatch(() => _localDataSource.saveToken(f), (_, __) {
        if (_ is AuthException) {
          return _.failure;
        }
        return const AuthFailure.interntOut();
      }).map((f) => unit);
    });
  }

  @override
  Stream<bool> logedIn() {
    return Rx.fromCallable(() => _localDataSource.getToken())
        .map(((e) => e.isNotEmpty));
  }

  @override
  TaskEither<AuthFailure, Unit> login(
      {required String email, required String password}) {
    return TaskEither.tryCatch(
        () => _remoteDataSource.login(email: email, password: password),
        (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).map((e) => unit);
  }

  @override
  TaskEither<AuthFailure, Unit> forgetPassword({required String mobile}) {
    return TaskEither.tryCatch(
        () => _remoteDataSource.forgetPassword(mobile: mobile), (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).map((e) => unit);
  }

  @override
  TaskEither<AuthFailure, Unit> resetPassword(
      {required String token,
      required String password,
      required String cpassword}) {
    return TaskEither.tryCatch(
        () => _remoteDataSource.resetPassword(
            token: token, password: password, cpassword: cpassword), (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).map((e) => unit);
  }

  @override
  TaskEither<AuthFailure, Unit> verfyOTP({required String otp}) {
    return TaskEither.tryCatch(() => _remoteDataSource.verfyOTP(otp: otp),
        (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).map((e) => unit);
  }

  @override
  Either<AuthFailure, String> getToken() {
    return Either.of(_localDataSource.getToken());
  }

  @override
  TaskEither<AuthFailure, Unit> logOut() {
    return TaskEither.tryCatch(
        () => _localDataSource.deleteToken(Value.tokenKey), (_, $_) {
      if (_ is AuthException) {
        return _.failure;
      }
      return const AuthFailure.interntOut();
    }).map((e) => unit);
  }
}
