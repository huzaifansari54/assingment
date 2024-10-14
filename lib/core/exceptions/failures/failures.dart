import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ApiFailure with _$ApiFailure {
  const factory ApiFailure.serverFailed({required String message}) =
      _ServerFailed;
  const factory ApiFailure.timeout() = _Timeout;
  const factory ApiFailure.internetOut() = _InternetOut;
  const factory ApiFailure.invalidToken() = _invalidCredential;
}
