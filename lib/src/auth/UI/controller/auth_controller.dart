import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/type_utils.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/core/halper/helper.dart';
import 'package:softlab/src/auth/UI/page/main_page.dart';
import 'package:softlab/src/auth/UI/page/register/register.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';
import 'package:softlab/src/auth/domain/use_case/facebook_login_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/forget_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/google_login_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/log_out_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/login_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/register_use_case.dart';
import 'package:softlab/src/auth/UI/controller/auth_state.dart';
import 'package:softlab/src/auth/domain/use_case/reset_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/user_loged_inUSe_case.dart';
import 'package:softlab/src/auth/domain/use_case/verfy_otp_use_case.dart';
import '../../../../lc.dart';

final authProvder = StateNotifierProvider<AuthController, AuthState>((_) =>
    AuthController(
        lc(), lc(), lc(), lc(), lc(), lc(), lc(), lc(), lc(), lc(), lc()));
final hoursProvder = StateNotifierProvider<BussinesFormNotifier,
    Map<WeeksState, List<ValueState>>>((_) => BussinesFormNotifier());

class AuthController extends StateNotifier<AuthState>
    with FormValidator, BussinessForm {
  final RegisterUseCase _registerUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final FacebookLoginUseCase _facebookLoginUseCase;
  final LoginUseCase _loginUseCase;
  final UserLogedInUseCase _logedInUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final LogOutUseCase _logOutUseCase;
  // Auth Provider
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthController(
      this._registerUseCase,
      this._loginUseCase,
      this._logedInUseCase,
      this._forgetPasswordUseCase,
      this._resetPasswordUseCase,
      this._verifyOtpUseCase,
      this._logOutUseCase,
      this._googleLoginUseCase,
      this._facebookLoginUseCase,
      this._googleSignIn,
      this._facebookAuth)
      : super(AuthState.init()) {
    _logedInUseCase().listen(
      (auth) {
        state = state.copyWith(authanticated: auth);
      },
      onDone: () {},
    );
  }
  logout(BuildContext ctx, VoidCallback onLogOut) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _logOutUseCase(param: NoParam()).run();
    authOrFail.match(
        (failure) => state = state.copyWith(error: failure, isLoading: false),
        (_) {
      state = state.copyWith(isLoading: false, authanticated: false);
      onLogOut();
    });
  }

  register(BuildContext ctx, VoidCallback onDone) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _registerUseCase(param: state.userInfo).run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) {
      state = state.copyWith(isLoading: false);
      onDone();
    });
  }

  signUpWithgoogle(TextEditingController $email, TextEditingController $name,
      BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await _googleSignIn.signIn();

      if (user != null) {
        // final userAuth = await user.authentication;
        // final credential = GoogleAuthProvider.credential(
        //     idToken: userAuth.idToken, accessToken: userAuth.accessToken);
        // await FirebaseAuth.instance.signInWithCredential(credential);
        final name = user.displayName ?? "unknow";
        final email = user.email;
        $email.text = email;
        $name.text = name;
        state =
            state.copyWith(userInfo: state.userInfo.copyWith(type: "google"));
        setSocialId(user.id);
        setFullName(name);
        setEmail(email);
        state = state.copyWith(isLoading: false);

        return;
      }
    } catch (e) {
      context.snackbar(e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

  signWithgoogle(BuildContext ctx, TextEditingController $email) async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await _googleSignIn.signIn();

      if (user != null) {
        // final userAuth = await user.authentication;
        // final credential = GoogleAuthProvider.credential(
        //     idToken: userAuth.idToken, accessToken: userAuth.accessToken);
        // await FirebaseAuth.instance.signInWithCredential(credential);

        final email = user.email;
        $email.text = email;

        state =
            state.copyWith(userInfo: state.userInfo.copyWith(type: "google"));
        setSocialId(user.id);
        setEmail(email);
        state = state.copyWith(isLoading: false);

        return;
      }
    } catch (e) {
      ctx.snackbar(e.toString());
      state = state.copyWith(isLoading: false);
    }
    // state = state.copyWith(isLoading: true);

    // final authOrFail = await _googleLoginUseCase(param: state.userInfo).run();
    // authOrFail.match((failure) {
    //   state = state.copyWith(error: failure, isLoading: false);
    //   showError(failure.$map(), ctx);
    // }, (_) {
    //   state = state.copyWith(isLoading: false);
    //   onDone();
    // });
  }

  signWithfacebook(BuildContext ctx, VoidCallback onDone) async {
    state = state.copyWith(isLoading: true);

    final authOrFail = await _facebookLoginUseCase(param: state.userInfo).run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) {
      state = state.copyWith(isLoading: false);
      onDone();
    });
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

  login(BuildContext ctx, VoidCallback onLogin) async {
    state = state.copyWith(isLoading: true);
    final UserModelInfo(:social_id, :type) = state.userInfo;
    final s_id = social_id.isEmpty ? null : social_id;
    final typ = type.isEmpty ? null : type;
    final authOrFail = await _loginUseCase(
            param: LoginParam(
                socialId: s_id,
                type: typ,
                email: state.userInfo.email,
                password: state.userInfo.password))
        .run();
    authOrFail.match((failure) {
      state = state.copyWith(error: failure, isLoading: false);
      showError(failure.$map(), ctx);
    }, (_) {
      state = state.copyWith(isLoading: false);
      onLogin();
    });
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

  setRePasword(String val) {
    final $user = state.userInfo.copyWith(registration_proof: val);
    state = state.copyWith(userInfo: $user);
  }

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

  setGoogleSign(String val) {
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
