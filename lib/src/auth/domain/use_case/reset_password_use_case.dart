import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/UI/page/reset_page.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

import '../../../../core/exceptions/failures/auth_failure.dart';
import '../repository/auth_repository.dart';

class ResetPasswordUseCase extends UseCase<ResetPasswordParam, Unit> {
  final $AuthRepository _repository;

  ResetPasswordUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required ResetPasswordParam param}) {
    return TaskEither.fromEither(_repository.getToken()).flatMap((token) {
      return _repository.resetPassword(
          token: token, password: param.password, cpassword: param.cpassword);
    });
  }
}

final class ResetPasswordParam {
  final String password;
  final String cpassword;

  ResetPasswordParam({required this.password, required this.cpassword});
}
