import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/type_utils.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/core/halper/helper.dart';
import 'package:softlab/src/auth/UI/page/register/register.dart';
import 'package:softlab/src/auth/domain/use_case/forget_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/login_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/register_use_case.dart';
import 'package:softlab/src/auth/UI/controller/auth_state.dart';
import 'package:softlab/src/auth/domain/use_case/reset_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/user_loged_inUSe_case.dart';
import 'package:softlab/src/auth/domain/use_case/verfy_otp_use_case.dart';

import '../../../../lc.dart';

final authProvder = StateNotifierProvider<AuthController, AuthState>(
    (_) => AuthController(lc(), lc(), lc(), lc(), lc(), lc()));
final hoursProvder = StateNotifierProvider<BussinesFormNotifier,
    Map<WeeksState, List<ValueState>>>((_) => BussinesFormNotifier());

class AuthController extends StateNotifier<AuthState>
    with FormValidator, BussinessForm {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final UserLogedInUseCase _logedInUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  AuthController(
      this._registerUseCase,
      this._loginUseCase,
      this._logedInUseCase,
      this._forgetPasswordUseCase,
      this._resetPasswordUseCase,
      this._verifyOtpUseCase)
      : super(AuthState.init()) {
    _logedInUseCase().listen(
      (auth) {
        state = state.copyWith(authanticated: auth);
      },
      onDone: () {},
    );
  }

  register(BuildContext ctx) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _registerUseCase(param: state.userInfo).run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) => state = state.copyWith(isLoading: false));
  }

  forgetPassword(BuildContext ctx) async {
    state = state.copyWith(isLoading: true);

    final authOrFail =
        await _forgetPasswordUseCase(param: ForgetParam(state.userInfo.phone))
            .run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) => state = state.copyWith(isLoading: false));
  }

  veryOtp(BuildContext ctx) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _verifyOtpUseCase(param: VerifyParam("")).run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) => state = state.copyWith(isLoading: false));
  }

  resetPassword(BuildContext ctx) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _resetPasswordUseCase(
            param: ResetPasswordParam(
                password: state.userInfo.password,
                cpassword: state.userInfo.password))
        .run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) => state = state.copyWith(isLoading: false));
  }

  login(BuildContext ctx) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _loginUseCase(
            param: LoginParam(
                email: state.userInfo.email, password: state.userInfo.password))
        .run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) => state = state.copyWith(isLoading: false));
  }

  bool validate(String val) => val.isNotEmpty;

  bool validates() {
    return state.userInfo.$1formEmty();
  }
}

mixin FormValidator {
  AuthState get state;
  set state(AuthState state);

  setFullName(String val) {
    final $user = state.userInfo.copyWith(fullname: val);
    state = state.copyWith(userInfo: $user);
  }

  setPhone(String val) {
    final $user = state.userInfo.copyWith(phone: "+91$val");
    state = state.copyWith(userInfo: $user);
  }

  setPassword(String val) {
    final $user = state.userInfo.copyWith(password: val);
    state = state.copyWith(userInfo: $user);
  }

  setRePasword(String val) {}

  setEmail(String val) {
    final $user = state.userInfo.copyWith(email: val);
    state = state.copyWith(userInfo: $user);
  }

  setAddress(String val) {
    final $user = state.userInfo.copyWith(address: val);
    state = state.copyWith(userInfo: $user);
  }

  setBussiness(String val) {
    final $user = state.userInfo.copyWith(bussinessName: val);
    state = state.copyWith(userInfo: $user);
  }

  setCity(String val) {
    final $user = state.userInfo.copyWith(city: val);
    state = state.copyWith(userInfo: $user);
  }

  setState(String val) {
    final $user = state.userInfo.copyWith(state: val);
    state = state.copyWith(userInfo: $user);
  }

  setinFormalName(String val) {
    final $user = state.userInfo.copyWith(informal_name: val);
    state = state.copyWith(userInfo: $user);
  }

  setZip(num val) {
    final $user = state.userInfo.copyWith(zip_code: val);
    state = state.copyWith(userInfo: $user);
  }

  setDeviceToken(String val) {
    final $user = state.userInfo.copyWith(device_token: val);
    state = state.copyWith(userInfo: $user);
  }

  setSocialId(String val) {
    final $user = state.userInfo.copyWith(social_id: val);
    state = state.copyWith(userInfo: $user);
  }

  setRole(String val) {
    final $user = state.userInfo.copyWith(role: val);
    state = state.copyWith(userInfo: $user);
  }

  setVerification(String val) {
    final $user = state.userInfo.copyWith(registration_proof: val);
    state = state.copyWith(userInfo: $user);
  }
}

mixin BussinessForm {
  AuthState get state;
  set state(AuthState state);

  setHours(Map<Week, List<String>> mapper) {
    final map = mapper;
    final userInfoMap = map.map((k, v) => MapEntry(k.name.toLowerCase(), v));
    state = state.copyWith(
        userInfo: state.userInfo.copyWith(business_hours: userInfoMap));
  }
}

class BussinesFormNotifier
    extends StateNotifier<Map<WeeksState, List<ValueState>>> {
  BussinesFormNotifier() : super(<WeeksState, List<ValueState>>{}.hoursWeek);

  List<ValueState> value(Week w) =>
      state[state.keys.firstWhere((e) => e.week == w)] ?? [];
  bool isNotEmty() {
    return state.values.any((e) => e.any((e) => e.selected));
  }

  void setWeek(Week week, bool completed, bool selected) {
    state = state.map((k, v) {
      if (k.week == week) {
        return MapEntry(
            k.copyWith(completed: completed, selected: selected), v);
      }
      return MapEntry(k, v);
    });
  }

  void setValue(
    Week week,
    String value,
  ) {
    state = state.map((k, v) {
      if (k.week == week) {
        final temp = <ValueState>[];
        for (var element in v) {
          if (element.value == value) {
            element = element.copyWith(selected: element.selected.toogle);
            temp.add(element);
          }
          temp.add(element);
        }
        return MapEntry(k, temp.toSet().toList());
      }
      return MapEntry(k, v);
    });
  }

  Map<Week, List<String>> values() {
    final val = state.map((k, v) {
      final temp = <ValueState>[];
      if (k.completed.or(k.selected)) {
        for (var element in v) {
          if (element.selected) {
            temp.add(element);
          }
        }
      }

      return MapEntry(k, temp.toSet().toList());
    });
    return val.fromMap();
  }
}
