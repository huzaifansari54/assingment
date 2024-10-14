import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:softlab/core/exceptions/failures/failures.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.otpFailed() = _otpFailed;
  const factory AuthFailure.interntOut() = _internentOut;
  const factory AuthFailure.server(String message) = _server;
  const factory AuthFailure.unknown(String message) = _Unknown;
  const factory AuthFailure.invalidToken() = _invalidCredential;

  ApiFailure $map() => when(
      otpFailed: () => const ApiFailure.serverFailed(message: "OTP Failed"),
      interntOut: () => const ApiFailure.internetOut(),
      server: (_) => ApiFailure.serverFailed(message: _),
      unknown: (_) => ApiFailure.serverFailed(message: _),
      invalidToken: () => const ApiFailure.invalidToken());
}
