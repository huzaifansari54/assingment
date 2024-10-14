import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';
import '../../../../core/exceptions/failures/auth_failure.dart';

abstract interface class $AuthRepository {
  TaskEither<AuthFailure, Unit> login(
      {required String email, required String password});
  Stream<bool> logedIn();
  Either<AuthFailure, String> getToken();
  TaskEither<AuthFailure, Unit> register(UserModelInfo userModelInfo);
  TaskEither<AuthFailure, Unit> forgetPassword({required String mobile});
  TaskEither<AuthFailure, Unit> verfyOTP({required String otp});
  TaskEither<AuthFailure, Unit> resetPassword(
      {required String token,
      required String password,
      required String cpassword});
}
