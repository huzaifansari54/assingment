import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

enum Week { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState(
      {required bool isLoading,
      required bool authanticated,
      required AuthFailure error,
      required UserModelInfo userInfo}) = _AuthState;

  factory AuthState.init() => AuthState(
      authanticated: false,
      isLoading: false,
      error: const AuthFailure.unknown(""),
      userInfo: UserModelInfo.r_());
}

@freezed
abstract class WeeksState with _$WeeksState {
  const WeeksState._();
  const factory WeeksState(
      {required Week week,
      required bool selected,
      required bool completed}) = _WeeksState;
}

@freezed
abstract class ValueState with _$ValueState {
  const ValueState._();
  const factory ValueState(
      {required Week week,
      required String value,
      required bool selected}) = _ValueState;
}
