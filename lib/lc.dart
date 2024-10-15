import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softlab/src/auth/data/data_source/auth_local_data_souece.dart';
import 'package:softlab/src/auth/data/data_source/auth_remote_data_source.dart';
import 'package:softlab/src/auth/data/repository/auth_repository_imp.dart';
import 'package:softlab/src/auth/domain/repository/auth_repository.dart';
import 'package:softlab/src/auth/domain/use_case/forget_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/log_out_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/login_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/register_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/reset_password_use_case.dart';
import 'package:softlab/src/auth/domain/use_case/user_loged_inUSe_case.dart';
import 'package:softlab/src/auth/domain/use_case/verfy_otp_use_case.dart';

const timoutDuration = Duration(seconds: 20);
const conectionTimeOut = Duration(seconds: 5);
final lc = GetIt.instance;
Future<void> setup() async {
  lc.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  lc.registerSingleton<Dio>(Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    sendTimeout: timoutDuration,
    connectTimeout: conectionTimeOut,
    receiveTimeout: timoutDuration,
    validateStatus: (status) => status! < 500,
  )));
  await lc.isReady<SharedPreferences>();
  lc
    ..registerSingleton<$AuthRemoteDataSource>(AuthRemoteDataSource(lc()))
    ..registerSingleton<$AuthLocalDataSource>(AuthLocalDataSouece(lc()))
    ..registerSingleton<$AuthRepository>(
        AuthRepository(localDataSource: lc(), remoteDataSource: lc()))
    ..registerSingleton(RegisterUseCase(repository: lc()))
    ..registerSingleton(LoginUseCase(repository: lc()))
    ..registerSingleton(UserLogedInUseCase(repository: lc()))
    ..registerSingleton(ForgetPasswordUseCase(repository: lc()))
    ..registerSingleton(ResetPasswordUseCase(repository: lc()))
    ..registerSingleton(VerifyOtpUseCase(repository: lc()))
    ..registerSingleton(LogOutUseCase(repository: lc()));
}
